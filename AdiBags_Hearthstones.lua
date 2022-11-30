--[[
AdiBags_Hearthstones - Adds various hearthing items to AdiBags virtual groups
© 2022 Paul Vandersypen, All Rights Reserved
]]--

local _, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
local L = addon.L

local db = addon.db

-- check for existing filter
local function CheckFilter(newFilter)
	local filterExists = false
	for _, value in AdiBags:IterateFilters() do
		if value.filterName == newFilter then
			filterExists = true
			return filterExists
		end
	end
	return filterExists
end

-- create filter
local function CreateFilter(name, uiName, uiDesc, title, items)
	local filter = AdiBags:RegisterFilter(uiName, 99, "ABEvent-1.0")
	-- Register Filter with AdiBags
	filter.uiName = uiName
	filter.uiDesc = uiDesc
	filter.items = items

	function filter:OnInitialize()
		-- Assign item table to filter
		self.items = filter.items
	end

	function filter:Update()
		self:SendMessage("AdiBags_FiltersChanged")
	end

	function filter:OnEnable()
		AdiBags:UpdateFilters()
	end

	function filter:OnDisable()
		AdiBags:UpdateFilters()
	end

	function filter:Filter(slotData)
		if self.items[tonumber(slotData.itemId)] then
			return title
		end
	end
end

-- run filter
local function AllFilters(db)
	for name, group in pairs(db.Filters) do
		-- Does filter already exist?
		local filterExists = CheckFilter(group.uiName)
		if not filterExists == nil or filterExists == false then
			-- name = Name of table
			-- group.uiName = Name to use in filter listing
			-- group.uiDesc = Description to show in filter listing
			-- group.items = table of items to sort
			CreateFilter(name, group.uiName, group.uiDesc, group.title, group.items)
		end
	end
end

-- start here
AllFilters(db)

-- the list of items, toys, cloaks, etc
local hearthstones = {
	128353,		-- Admiral's Compass
	140192,		-- Dalaran Hearthstone
	110560,		-- Garrison Hearthstone
	118663,		-- Relic of Karabor
	29796,		-- Socrethar's Teleportation Stone
	64457,		-- The Last Relic of Argus
	118662,		-- Bladespire Relic
	132517,		-- Intra-Dalaran Wormhole Generator
	140493,		-- Adept's Guide to Dimensional Rifting
	128502,		-- Hunter's Seeking Crystal
	128503,		-- Master Hunter's Seeking Crystal
	132523,		-- Reaves Battery
	144341,		-- Rechargeable Reaves Battery
	138448,		-- Emblem of Margoss
	141605,		-- Flight Master's Whistle
	168862,		-- G.E.A.R. Tracking Beacon
	159224,		-- Zuldazar Hearthstone
	180817,		-- Cypher of Relocation (Ve'nari's Refuge)
	184504,		-- Attendant's Pocket Portal: Oribos
	184501,		-- Attendant's Pocket Portal: Revendreth
	184503,		-- Attendant's Pocket Portal: Ardenweald
	184502,		-- Attendant's Pocket Portal: Maldraxxus
	184500,		-- Attendant's Pocket Portal: Bastion
}

local armour = {
	63379,		-- Baradin's Wardens Tabard
	63378,		-- Hellscream's Reach Tabard
	50287,		-- Boots of the Bay
	65274,		-- Cloak of Coordination: Orgrimmar
	65360,		-- Cloak of Coordination: Stormwind
	63353,		-- Shroud of Cooperation: Orgrimmar
	63352,		-- Shroud of Cooperation: Stormwind
	63207,		-- Wrap of Unity: Orgrimmar
	63206,		-- Wrap of Unity: Stormwind
	169064,		-- Montebank's Colorful Cloak
	142298,		-- Astonishingly Scarlet Slippers
}

local jewelry = {
	32757,		-- Blessed Medallion of Karabor
	139599,		-- Empowered Ring of the Kirin Tor
	118907,		-- Pit Fighter's Punching Ring (Bizmo's Brawlpub)
	95051,		-- The Brassiest Knuckle (Bizmo's Brawlpub)
	118908,		-- Pit Fighter's Punching Ring (Brawl'gar Arena)
	95050,		-- The Brassiest Knuckle (Brawl'gar Arena)
	103678,		-- Time-Lost Artifact
	144391,		-- Pugilist's Powerful Punching Ring (Alliance)
	144392,		-- Pugilist's Powerful Punching Ring (Horde)
	142469,		-- Violet Seal of the Grand Magus
	141324,		-- Talisman of the Shal'dorei
	166560,		-- Captain's Signet of Command
	166559,		-- Commander's Signet of Battle
}

local quest_items = {
	61379,		-- Gidwin's Hearthstone
	68808,		-- Hero's Hearthstone
	68809,		-- Veteran's Hearthstone
	92510,		-- Vol'jin's Hearthstone
	132119,		-- Orgrimmar Portal Stone
	132120,		-- Stormwind Portal Stone
	172203,		-- Cracked Hearthstone
	173537,		-- Glowing Hearthstone
	173373,		-- Faol's Hearthstone
	173528,		-- Gilded Hearthstone
	173716,		-- Mossy Hearthstone
}

local scrolls = {
	119183,		-- Scroll of Risky Recall
	139590,		-- Scroll of Teleport: Ravenholdt
	58487,		-- Potion of Deepholm
	141015,		-- Scroll of Town Portal: Kal'delar
	141014,		-- Scroll of Town Portal: Sashj'tar
	141017,		-- Scroll of Town Portal: Lian'tril
	141016,		-- Scroll of Town Portal: Faronaar
	141013,		-- Scroll of Town Portal: Shala'nir
	142543,		-- Scroll of Town Portal (Diablo 3 event)
	150733,		-- Scroll of Town Portal (Ar'gorok in Arathi)
	160219,		-- Scroll of Town Portal (Stromgarde in Arathi)
	163694,		-- Scroll of Luxurious Recall
	173430,		-- Nexus Teleport Scroll
	181163,		-- Scroll of Teleport: Theater of Pain
}

local toys = {
	93672,		-- Dark Portal
	23486,		-- Dimensional Ripper - Everlook
	64488,		-- Innkeeper's Daughter
	95567,		-- Kirin Tor Beacon
	95568,		-- Sunreaver Beacon
	43824,		-- The Schools of Arcane Magic - Mastery
	167075,		-- Ultrasafe Transporter: Mechagon
	112059,		-- Wormhole Centrifuge
	151652,		-- Wormhole Generator: Argus
	87215,		-- Wormhole Generator: Pandaria
	172924,		-- Wormhole Generator: Shadowlands
	142542,		-- Tome of Town Portal (Diablo 3 event)
	168807,		-- Wormhole Generator: Kul Tiras
	168808,		-- Wormhole Generator: Zandalar
	166746,		-- Fire Eater's Hearthstone
	166747,		-- Brewfest Reveler's Hearthstone
	162973,		-- Greatfather Winter's Hearthstone
	163045,		-- Headless Horseman's Hearthstone
	168907,		-- Holographic Digitalization Hearthstone
	165669,		-- Lunar Elder's Hearthstone
	165802,		-- Noble Gardener's Hearthstone
	165670,		-- Peddlefeet's Lovely Hearthstone
	182773,		-- Necrolord's Hearthstone
	184353,		-- Kyrian Hearthstone
	183716,		-- Venthyr Sinstone
	180290,		-- Night Fae Hearthstone
	169297,		-- Stormpike Insignia
}