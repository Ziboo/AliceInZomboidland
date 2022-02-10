---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---

local inventory_utils = require("InventoryUtils")



--- We check if the player is wearing the Phone
---@param player AliasPlayer
local function CheckIfPlayingMod(player)

    if player == nil then
        return
    end

    local phone = inventory_utils.GetEquippedPhone(player)

    if phone == nil then
        player:Say("Not playing 'Alice in Zomboidland' anymore...")
    else
        player:Say("Playing 'Alice in Zomboidland' ! Need to check my Visa expiration time !")
    end
end

local Init = function()
    local player = getPlayer()
    CheckIfPlayingMod(player)
    print("------- TICK")
    Events.OnTick.Remove(Init);
end

local function UpdateCloth(player)
    print("------- UpdateClothing")
    CheckIfPlayingMod(player)
end

--Events.EveryOneMinute.Add(EveryOneMinute)
Events.OnClothingUpdated.Add(UpdateCloth);
Events.OnTick.Add(Init);