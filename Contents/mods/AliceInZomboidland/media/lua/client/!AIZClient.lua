---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---

--- We check if the player is wearing the Phone
local function CheckIfPlayingMod(player)

    if player == nil then
        return
    end

    local phone = AIZ.Shared.Utils.Inventory.GetEquippedPhone(player)

    if phone == nil then
        player:Say("Not playing 'Alice in Zomboidland' anymore...")
    else
        player:Say("Playing 'Alice in Zomboidland' ! Need to check my Visa expiration time !")
    end
end

local Init = function()
    local player = getPlayer()
    CheckIfPlayingMod(player)
    Events.OnTick.Remove(Init);
end

local function UpdateCloth(player)
    CheckIfPlayingMod(player)
end

--Events.EveryOneMinute.Add(EveryOneMinute)
Events.OnClothingUpdated.Add(UpdateCloth);
Events.OnTick.Add(Init);