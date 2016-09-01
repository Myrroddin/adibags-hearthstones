--[[
AdiBags_Hearths - Adds various hearthing items to AdiBags virtual groups
© 2016 Paul "Myrroddin" Vandersypen, All Rights Reserved
]]--

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L
local MatchIDs
local Tooltip

local function MatchIDs_Init(self)
	local Result = {}
	
	local IDs = {
		128353,			-- Admiral's Compass
		140192,			-- Dalaran Hearthstone
		110560,			-- Garrison Hearthstone
		6948,			-- Hearthstone
		118663,			-- Relic of Karabor
	}
	AddToSet(Result, IDs)
	
	if self.db.profile.moveArmour then
		IDs = {
			28585,		-- Ruby Slippers
		}
		AddToSet(Result, IDs)
	end
	
	if self.db.profile.moveJewelry then
		IDs = {
			139599,		-- Empowered Ring of the Kirin Tor
			48956,		-- Etched Ring of the Kirin Tor
			45690,		-- Inscribed Ring of the Kirin Tor
			44935,		-- Ring of the Kirin Tor
			51559,		-- Runed Ring of the Kirin Tor
		}
		AddToSet(Result, IDs)
	end
	
	if self.db.profile.moveQuests then
		IDs = {
			61379,		-- Gidwin's Hearthstone
			68808,		-- Hero's Hearthstone
			68809,		-- Veteran's Hearthstone
			92510,		-- Vol'jin's Hearthstone
		}
		AddToSet(Result, IDs)
	end
	
	if self.db.profile.moveScrolls then
		IDs = {
			48248,		-- Scroll of Recall
			60336,		-- Scroll of Recall II
			60337,		-- Scroll of Recall III
		}
		AddToSet(Result, IDs)
	end
	
	if self.db.profile.moveToys then
		IDs = {
			64488,		-- Innkeeper's Daughter
		}
		AddToSet(Result, IDs)
	end
	
	return Result
 end
 
local function Tooltip_Init()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1, 6 do
		local Left, Right = tip:CreateFontString(), tip:CreateFontString()
		Left:SetFontObject(GameFontNormal)
		Right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(Left, Right)
		leftside[i] = Left
	end
	tip.leftside = leftside
	return tip
end
 
local function AddToSet(Set, List)
	for _, v in ipairs(List) do
		Set[v] = true
	end
end

local setFilter = AdiBags:RegisterFilter("Hearthstones", 92, "ABEvent-1.0")
setFilter.uiName = TUTORIAL_TITLE31
setFilter.uiDesc = L["Items that hearth you to various places."]

function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace("Hearthstones", {
		profile = {
			moveArmour = true, 
			moveJewelry = true,
			moveQuests = true,
			moveScrolls = false, 
			moveToys = false
		},
		char = {},
	})
end

function setFilter:Update()
	MatchIDs = nil
	self:SendMessage("AdiBags_FiltersChanged")
end

function setFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function setFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function setFilter:Filter(slotData)
	MatchIDs = MatchIDs or MatchIDs_Init(self)
	if MatchIDs[slotData.itemId] then
		return TUTORIAL_TITLE31
	end
	
	Tooltip = Tooltip or Tooltip_Init()
	Tooltip:SetOwner(UIParent,"ANCHOR_NONE")
	Tooltip:ClearLines()
	
	if slotData.bag == BANK_CONTAINER then
		Tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		Tooltip:SetBagItem(slotData.bag, slotData.slot)
	end
	
	Tooltip:Hide()
end

function setFilter:GetOptions()
	return {
		moveArmour = {
			name  = AUCTION_CATEGORY_ARMOR,
			desc  = L["Show items like Ruby Slippers in this group."],
			type  = "toggle",
			order = 10
		},
		moveJewelry = {
			name  = L["Jewelry"],
			desc  = L["Show items like the Kirin Tor rings in this group."],
			type  = "toggle",
			order = 20
		},
		moveQuests = {
			name = QUESTS_LABEL,
			desc = L["Show quest items that portal in this group."],
			type = "toggle",
			order = 30
		},
		moveScrolls = {
			name  = L["Scrolls"],
			desc  = L["Show items like Inscription teleport scrolls in this group."],
			type  = "toggle",
			order = 40
		},
		moveToys = {
			name  = TOY,
			desc  = L["Show items like Innkeeper's Daughter in this group."],
			type  = "toggle",
			order = 50
		}
	},
	AdiBags:GetOptionHandler(self, false, function()
		return self:Update()
	end)
end