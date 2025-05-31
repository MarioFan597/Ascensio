-- Preparing global property for animation stuff
-- Doing this to anticipate other mods using this system
if not G.cardanim then
    G.cardanim = {
        DEBUGGING = {}, -- Modules can add entries to this table to see what is happening within it
        card_layers = {},
        animation_macros = {}
    }
end

-- [[ DEFINING CARD LAYERS ]]
G.cardanim.card_layers.pos = {
    coords = function(p_center) return p_center.pos end,
    child  = function(children) return children.center end
}
G.cardanim.card_layers.soul_pos = {
    coords = function(p_center) return p_center.soul_pos end,
    child  = function(children) return children.floating_sprite end
}
G.cardanim.card_layers.soul_pos_extra = {
    coords = function(p_center) return p_center.soul_pos and p_center.soul_pos.extra or nil end,
    child  = function(children) return children.floating_sprite2 end
}

-- [[ MACRO LOADING ]]
local macros = {
    "skim"
}

G.cardanim.animation_macros = {}
for _,v in pairs(macros) do
    assert(SMODS.load_file("lib/animation_macros/"..v..".lua"))()
end

-- [[ ANIMATION LOADING EVENT ]]
-- This will only load after the game is actually ready to do stuff
G.E_MANAGER:add_event(Event{blocking=false,func=function() -- anti-nesting
-----------
-- Only do all of the following if animations haven't been set up yet
-- (Only one mod needs to do so, and it will do so for all mods, including cross-mods)
if G.cardanim.animation_details then return true end

-- Register animations
G.cardanim.animation_details = {}
local anim_details = G.cardanim.animation_details
for card_key,card_center in pairs(G.P_CENTERS) do
    local card_anim = card_center.animation
    if not card_anim then goto continuecenters end

    -- Run macro
    if card_anim.macro and card_anim.macro.type then
        local macro_obj = card_anim.macro
        macro_obj.card_key = card_key

        local macro_frames = G.cardanim.animation_macros[macro_obj.type](macro_obj)
        if macro_frames then card_anim.frames = macro_frames end
    end

    -- i_list - track ID of current frame
    -- t_list - track duration of current frame
    -- for both, keys are (keys of card_layers) AKA "keywords" or "kw"
    anim_details[card_key] = { i_list = {}, t_list = {}, seq = card_anim.frames }

    for kw,_ in pairs(G.cardanim.card_layers) do
        anim_details[card_key].i_list[kw] = 1
        anim_details[card_key].t_list[kw] = 1
    end

    ::continuecenters::
end

-- Start animation update
local sprite_dt = 0
local sprite_spf = 0.10 -- seconds per frame
local _game_update = Game.update
function Game:update(dt)
	_game_update(self, dt)
    sprite_dt = sprite_dt + dt -- cryptid has a check here but im not sure what it's for
    if sprite_dt < sprite_spf then goto skip end
    sprite_dt = sprite_dt - sprite_spf

    for card_key,card_anim_d in pairs(anim_details) do
        local card_def = G.P_CENTERS[card_key] -- you know the SMODS.Joker{...} and all that
        local frame_i = card_anim_d.i_list     -- track current frame id
        local frame_dur = card_anim_d.t_list   -- track current frame duration
        local frame_seq = card_anim_d.seq      -- list of all frames, each labeled with an id

        for kw,part in pairs(G.cardanim.card_layers) do if frame_seq[kw] and part.coords(card_def) then
            local pos_table = part.coords(card_def)
            local frame = frame_seq[kw][frame_i[kw]]

            -- basically just change x and y coords of a table
            if frame_dur[kw] == 1 then
                pos_table.x = frame.x
                pos_table.y = frame.y
            end

            -- progress through frames
            if not frame.t then frame.t = 1 end
            if frame.t == frame_dur[kw] then
                frame_i[kw] = frame_i[kw] + 1                            -- increase frame
                if frame_i[kw] > #frame_seq[kw] then frame_i[kw] = 1 end -- limit range of frames
                frame_dur[kw] = 1                                        -- limit range of duration

            else frame_dur[kw] = frame_dur[kw] + 1 end                   -- increase duration
        end end
    end

    -- apparently changing pos, etc. doesnt automatically update the sprite for all cards?
    -- so we need to use set_sprite_pos on each child of the card object thing
    for _, card in pairs(G.I.CARD) do
        -- not sure why but this is something that needs to be checked
        if not card.config.center then goto icardcontinue end

        local card_key = card.config.center.key
        -- If the card is not animatable
        if not anim_details[card_key] then goto icardcontinue end

        -- Grab card center and its frames
        local card_def = G.P_CENTERS[card_key]
        local frame_seq = anim_details[card_key].seq

        -- Update each layer, but only if frames are defined for that layer
        for kw,part in pairs(G.cardanim.card_layers) do if frame_seq[kw] and part.coords(card_def) then
            part.child(card.children):set_sprite_pos(part.coords(card_def))
        end end

        ::icardcontinue::
    end

    ::skip::
end
-----------
return true end})