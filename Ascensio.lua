Ascensionable = {}

if Entropy then
	Apothable = {}
end

---@param path string Path to the file
---@param id? string Mod ID. Defaults to `SMODS.current_mod`.
function loadFile(path, id)
	local chunk, err = SMODS.load_file(path, id)
	if err ~= nil or chunk == nil then
		return err
	end

	chunk()
end

loadFile("Atlas.lua")

---@enum (key) AscensioCrossMod
CrossMod = {
	Vanilla = 0,
	Cryptid = 1,
	Entropy = 2,
	Astronomica = 3,

	Ascensio = 999,
}

---@class AscensionEntry
---@field source? AscensioCrossMod Where is the source of the "Mortal" version of the Joker.
---@field from? string The key of the "Mortal" joker.
---@field to? string The key of the "Ascended" joker.
---@field to_entropic? string The key of the "Apotheosis" joker.
---@overload fun(self: AscensionEntry): AscensionEntry
AscensionEntry = setmetatable({}, {
	---@param self AscensionEntry
	__call = function(self)
		-- Defaults values
		self.source = self.source or "Vanilla"
		self.from = self.from or "j_joker"
		self.to = self.to or "j_asc_jimbo"

		Ascensionable[self.from] = self.to

		if Apothable and self.to_entropic then
			Apothable[self.from] = self.to_entropic
			Apothable[self.to] = self.to_entropic
		end

		return self
	end,
})

local new = AscensionEntry({ source = "Vanilla" })
