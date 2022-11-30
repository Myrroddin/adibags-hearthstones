local _, addon = ...
local L = addon.L

-- need to check game version
local isWrath = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
local isMainline = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

local db = {}

db.Filters = {
    ["Hearthstones"] = {
        uiName = TUTORIAL_TITLE31,
        uiDesc = L["Items that hearth you to various places."],
        title = TUTORIAL_TITLE31,
        items = {
            -- itemID               item name
            [6948] = true,          -- Hearthstone
            [17690] = true,         -- Frostwolf Insignia Rank 1
            [17691] = true,         -- Stormpike Insignia Rank 1
            [17900] = true,         -- Stormpike Insignia Rank 2
            [17901] = true,         -- Stormpike Insignia Rank 3
            [17902] = true,         -- Stormpike Insignia Rank 4
            [17903] = true,         -- Stormpike Insignia Rank 5
            [17904] = true,         -- Stormpike Insignia Rank 6
            [17905] = true,         -- Frostwolf Insignia Rank 2
            [17906] = true,         -- Frostwolf Insignia Rank 3
            [17907] = true,         -- Frostwolf Insignia Rank 4
            [17908] = true,         -- Frostwolf Insignia Rank 5
            [17909] = true,         -- Frostwolf Insignia Rank 6
            [18984] = true,         -- Dimensional Ripper - Everlook
            [22589] = true,         -- Atiesh, Greatstaff of the Guardian (Mage)
            [22630] = true,         -- Atiesh, Greatstaff of the Guardian (Warlock)
            [22631] = true,         -- Atiesh, Greatstaff of the Guardian (Priest)
            [22632] = true,         -- Atiesh, Greatstaff of the Guardian (Druid)
        }
    }
}

-- add TBC and Wrath items
if isWrath then
    db.Filters["Hearthstones"].items[23489]     = true      -- Ultrasafe Transporter - Gadgetzan
    db.Filters["Hearthstones"].items[28585]     = true      -- Ruby Slippers
    db.Filters["Hearthstones"].items[35230]     = true      -- Darnarian's Scroll of Teleportation
    db.Filters["Hearthstones"].items[36954]     = true      -- Dimensional Ripper - Area 52
    db.Filters["Hearthstones"].items[36955]     = true      -- Ultrasafe Transporter - Toshley's Station
    db.Filters["Hearthstones"].items[37863]     = true      -- Direbrew's Remote
    db.Filters["Hearthstones"].items[38685]     = true      -- Teleport Scroll: Zul'Farrak
    db.Filters["Hearthstones"].items[40585]     = true      -- Signet of the Kirin Tor
    db.Filters["Hearthstones"].items[40586]     = true      -- Band of the Kirin Tor
    db.Filters["Hearthstones"].items[44934]     = true      -- Loop of the Kirin Tor
    db.Filters["Hearthstones"].items[44935]     = true      -- Ring of the Kirin Tor
    db.Filters["Hearthstones"].items[45688]     = true      -- Inscribed Band of the Kirin Tor
    db.Filters["Hearthstones"].items[45689]     = true      -- Inscribed Loop of the Kirin Tor
    db.Filters["Hearthstones"].items[45690]     = true      -- Inscribed Ring of the Kirin Tor
    db.Filters["Hearthstones"].items[45691]     = true      -- Inscribed Signet of the Kirin Tor
    db.Filters["Hearthstones"].items[46874]     = true      -- Argent Crusader's Tabard
    db.Filters["Hearthstones"].items[48248]     = true      -- Scroll of Recall
    db.Filters["Hearthstones"].items[48933]     = true      -- Wormhole Generator: Northrend
    db.Filters["Hearthstones"].items[48954]     = true      -- Etched Band of the Kirin Tor
    db.Filters["Hearthstones"].items[48955]     = true      -- Etched Loop of the Kirin Tor
    db.Filters["Hearthstones"].items[48956]     = true      -- Etched Ring of the Kirin Tor
    db.Filters["Hearthstones"].items[48957]     = true      -- Etched Signet of the Kirin Tor
    db.Filters["Hearthstones"].items[51557]     = true      -- Runed Signet of the Kirin Tor
    db.Filters["Hearthstones"].items[51558]     = true      -- Runed Loop of the Kirin Tor
    db.Filters["Hearthstones"].items[51559]     = true      -- Runed Ring of the Kirin Tor
    db.Filters["Hearthstones"].items[51560]     = true      -- Runed Band of the Kirin Tor
    db.Filters["Hearthstones"].items[52251]     = true      -- Jaina's Locket
    db.Filters["Hearthstones"].items[54452]     = true      -- Ethereal Portal
    db.Filters["Hearthstones"].items[60336]     = true      -- Scroll of Recall II
    db.Filters["Hearthstones"].items[60337]     = true      -- Scroll of Recall III
    db.Filters["Hearthstones"].items[184871]    = true      -- Dark Portal (TBC)
    db.Filters["Hearthstones"].items[199335]    = true      -- Teleport Scroll: Menethil Harbor
    db.Filters["Hearthstones"].items[199336]    = true      -- Teleport Scroll: Stormwind Harbor
    db.Filters["Hearthstones"].items[199777]    = true      -- Teleport Scroll: Orgrimmar Zepplin Tower
    db.Filters["Hearthstones"].items[199778]    = true      -- Teleport Scroll: Undercity Zepplin Tower
    db.Filters["Hearthstones"].items[200068]    = true      -- Teleport Scroll: Shattrath City
end

-- add everything for mainline
if isMainline then
    
end
addon.db = db