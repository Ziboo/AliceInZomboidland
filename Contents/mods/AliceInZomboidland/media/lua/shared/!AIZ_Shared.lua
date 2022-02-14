---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---

---@alias AliasPlayer IsoPlayer | IsoGameCharacter | IsoGameCharacter | IsoLivingCharacter | IsoMovingObject | IsoObject
---@alias AliasItem InventoryItem


AIZMod = AIZMod or {}

local constants = require("AIZ_Constants")

AIZMod.Shared = {
    PlayerData = require("AIZ_PlayerData"),
    Constants = constants,
    InventoryUtils = require("AIZ_InventoryUtils"),
    UIUtils = require("AIZ_UIUtils")
}


local function log(type, message, ...)
    if getDebug() then
        local d = {select(1,...)} -- convert the ... argument to a table
        for i, v in ipairs(d) do d[i] = tostring(v) end -- convert each to a string representation
        local msg = "[AIZ][" .. type .. "][".. os.date ("%X") .. "] " .. message .. " [ " .. table.concat(d, ", ") .." ]"

        if type == "ERROR" then
            error(msg)
        else
            print(msg)
        end
    end
end

function AIZMod.Log(message, ...)
    log("DEBUG", message, ...)
end

function AIZMod.Warning(message, ...)
    log("WARNING", message, ...)
end

function AIZMod.Error(message, ...)
    log("ERROR", message, ...)

end


AIZMod.Log("Shared Init")

-- EVENTS
AIZMod.Log("Adding Custom Events")
LuaEventManager.AddEvent(constants.OnPhoneEquipChangedEvent);


-- Add body location for phone
AIZMod.Log("Adding Custom Body Locations")
local group = BodyLocations.getGroup("Human")
group:getOrCreateLocation(constants.PhoneBodyLocation)


-- DEBUG COMMANDS
-- my_item = AIZMod.Shared.InventoryUtils.GiveVisaToPlayer(getPlayer(), 500)