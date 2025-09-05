-- CARDANIM - Card animation system
-- Documentation can be found at https://github.com/Oinite12/balatro-modding-modules/

-- == CONFIG
local cardanim_cfg = {
	macro_directory = "lib/cardanim_macros",
	card_layers = {
		-- [[ DEFINING CARD LAYERS ]]
		-- coords is the part of the card definition that has x-y coords on the atlas
		-- child is the child of the card center that has the "set_sprite_pos" method
		pos = {
			coords = function(p_center)
				return p_center.pos
			end,
			child = function(children)
				return children.center
			end
		},
		soul_pos = {
			coords = function(p_center)
				return p_center.soul_pos
			end,
			child = function(children)
				return children.floating_sprite
			end
		},
		soul_pos_extra = {
			coords = function(p_center)
				return p_center.soul_pos and p_center.soul_pos.extra or nil
			end,
			child = function(children)
				return children.floating_sprite2
			end
		},
	},
	-- [[ FRAMERATE GRANULARITY]]
	-- How many frames can play within 0.1 seconds?
	granularity = 2
}


local mod_prefix = SMODS.current_mod.prefix
-- Create global cardanim tables
G[mod_prefix .. "_cardanim_cfg"] = cardanim_cfg
G[mod_prefix .. "_cardanim"] = {
	DEBUG = {}, -- Modules can add entries to this table for debugging purposes
}
local cardanim_tbl = G[mod_prefix .. "_cardanim"]

-- Load macros
cardanim_tbl.macro_functions = {}
local current_mod_path = tostring(SMODS.current_mod.path)
local files = NFS.getDirectoryItems(current_mod_path .. cardanim_cfg.macro_directory)
for _,file_name in ipairs(files) do
	local macro_name = file_name:gsub(".lua", "")
	local f,err = SMODS.load_file(cardanim_cfg.macro_directory .. "/" .. file_name)
	if err then error(err) end
	cardanim_tbl.macro_functions[macro_name] = f()
end

-- This will only run after the game is finished loading
-- i.e. after all items are registered
G.E_MANAGER:add_event(Event {
	blocking = false,
	func = function()

		-- [[ ANIMATION REGISTRATION ]]
		cardanim_tbl.animation_details = {}
		local anim_details = cardanim_tbl.animation_details
		for card_key, card_center in pairs(G.P_CENTERS) do
			local card_anim = card_center.animation
			if (
				not card_anim
				or not card_key:match("_"..mod_prefix.."_") -- only target centers from this mod
			) then goto continue_centers end

			-- Run macro
			if card_anim.macro and card_anim.macro.type then
				local macro_obj = card_anim.macro
				macro_obj.card_key = card_key

				local macro_frames = cardanim_tbl.macro_functions[macro_obj.type](macro_obj)
				if macro_frames then
					card_anim.frames = macro_frames
				end
			end

			anim_details[card_key] = {
				current_frame_id = {},
				current_frame_duration = {},
				sequence = card_anim.frames
			}

			for layer_name, _ in pairs(cardanim_cfg.card_layers) do
				anim_details[card_key].current_frame_id[layer_name] = 1
				anim_details[card_key].current_frame_duration[layer_name] = 1
			end

			::continue_centers::
		end

		-- [[ ANIMATION UPDATING ]]
		-- Start animation update
		local sprite_dt = 0
		local sprite_spf = 0.1/cardanim_cfg.granularity -- seconds per frame
		local _game_update = Game.update

		function Game:update(dt) -- hella sus, akin to performing brain surgery on yourself
			_game_update(self, dt)
			-- dt accounts for different frame rates,
			-- hence this is required for constant animations across all devices
			sprite_dt = sprite_dt + dt
			if sprite_dt < sprite_spf then
				goto skip_update
			end
			sprite_dt = sprite_dt - sprite_spf

			for card_key, card_anim_d in pairs(anim_details) do
				local card_def = G.P_CENTERS[card_key]
				local frame_id = card_anim_d.current_frame_id
				local frame_duration = card_anim_d.current_frame_duration
				local frame_sequence = card_anim_d.sequence

				for layer_name, part in pairs(cardanim_cfg.card_layers) do
					if frame_sequence[layer_name] and part.coords(card_def) then
						local pos_table = part.coords(card_def)
						local frame = frame_sequence[layer_name][frame_id[layer_name]]

						-- basically just change x and y coords of a table
						if frame_duration[layer_name] == 1 then
							pos_table.x = frame.x
							pos_table.y = frame.y
						end

						-- progress through frames
						if not frame.t then
							frame.t = 1 -- default to 1 frame per 0.1s, regardless of granularity
						end
						local proper_frame_duration = frame.t*cardanim_cfg.granularity
						if proper_frame_duration <= frame_duration[layer_name] then
							frame_id[layer_name] = frame_id[layer_name] + 1 -- increase frame
							if frame_id[layer_name] > #frame_sequence[layer_name] then
								frame_id[layer_name] = 1
							end -- limit range of frames
							frame_duration[layer_name] = 1 -- limit range of duration
						else
							frame_duration[layer_name] = frame_duration[layer_name] + 1
						end -- increase duration
					end
				end
			end

			-- apparently changing pos, etc. doesnt automatically update the sprite for all cards
			-- so we need to use set_sprite_pos on each child of the card object thing
			for _, card in pairs(G.I.CARD) do
				-- Skip cards without centers (I think playing cards?)
				if not card.config.center then
					goto i_card_continue
				end

				local card_key = card.config.center.key
				-- If the card has no animation, skip
				if
					not anim_details[card_key]
					or card.facing == "back"
					or not card.config.center.unlocked
					or not card.config.center.discovered
				then
					goto i_card_continue
				end

				-- Grab card center and its frames
				local card_def = G.P_CENTERS[card_key]
				local frame_sequence = anim_details[card_key].sequence

				-- Update each layer, but only if frames are defined for that layer
				for kw, part in pairs(cardanim_cfg.card_layers) do
					if frame_sequence[kw] and part.coords(card_def) then
						part.child(card.children):set_sprite_pos(part.coords(card_def))
					end
				end

				::i_card_continue::
			end

			::skip_update::
		end
		return true
	end
})