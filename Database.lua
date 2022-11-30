local _, pt = ...
local L = pt.L

-- need to check game version
local isWrath = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
local isMainline = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

local db = {}

db.Filters ={
    ["Hearthstones"] = {
        uiName = TUTORIAL_TITLE31,
        uiDesc = L["Items that hearth you to various places."],
        title = TUTORIAL_TITLE31,
        items = {
            -- itemID               item name
            [6948] = true,          -- Hearthstone
        }
    }
}
pt.db = db