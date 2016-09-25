--[[
AdiBags_Hearths - Adds various hearthing items to AdiBags virtual groups
© 2016 Paul "Myrroddin" Vandersypen, All Rights Reserved
]]--

local addonName, addon = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.L = L

local locale = GetLocale()

if locale == "ruRU" then
--@localization(locale="ruRU", format="lua_additive_table")@

elseif locale == "deDE" then
--@localization(locale="deDE", format="lua_additive_table")@

elseif locale == "itIT" then
--@localization(locale="itIT", format="lua_additive_table")@

elseif locale == "frFR" then
--@localization(locale="frFR", format="lua_additive_table")@

elseif locale == "koKR" then
--@localization(locale="koKR", format="lua_additive_table")@

elseif locale == "zhCN" then
--@localization(locale="zhCN", format="lua_additive_table")@

elseif locale == "ptBR" then
--@localization(locale="ptBR", format="lua_additive_table")@

elseif locale == "zhTW" then
--@localization(locale="zhTW", format="lua_additive_table")@

elseif locale == "esES" then
--@localization(locale="esES", format="lua_additive_table")@

elseif locale == "esMX" then
--@localization(locale="esMX", format="lua_additive_table")@

else
-- enUS default
L["Flight Master's Whistle"] = true
L["FMW isn't a Hearthstone, but helps you get around faster."] = true
L["Items that hearth you to various places."] = true
L["Jewelry"] = true
L["Show items like Innkeeper's Daughter in this group."] = true
L["Show items like the Kirin Tor rings in this group."] = true
L["Show items like Ruby Slippers in this group."] = true
L["Show quest items that portal in this group."] = true
end

-- Replace remaining true values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end