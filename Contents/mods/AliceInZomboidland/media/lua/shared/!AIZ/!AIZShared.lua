---@class AIZ
AIZ = AIZ or {}

AIZ.Shared.Constants = require("Constants")

AIZ.Shared = {}
AIZ.Shared.Utils = {
    Inventory = require("InventoryUtils")
}



-- Add body location for phone
local group = BodyLocations.getGroup("Human")
group:getOrCreateLocation("AIZ_Phone_Body_Location")

return AIZ
