---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---

local inventory_utils = require("InventoryUtils")
local constants = require("Constants")
local player_data = require("PlayerData")

-- Add the event to the manager
LuaEventManager.AddEvent("AIZ_OnWearItem");
LuaEventManager.AddEvent("AIZ_OnUnequipItem");

local ISWearClothing_perform = ISWearClothing.perform;
function ISWearClothing:perform(...)
    ISWearClothing_perform(self, ...);
    triggerEvent("AIZ_OnWearItem", self.character, self.item);
end

local ISUnequipAction_perform = ISUnequipAction.perform;
function ISUnequipAction:perform(...)
    ISUnequipAction_perform(self, ...);
    triggerEvent("AIZ_OnUnequipItem", self.character, self.item);
end





--- We check if the player is wearing the Phone
---@param player AliasPlayer
local function CheckIfPlayingMod(player)
    if player == nil then   return  end


    local phone = inventory_utils.GetEquippedPhone(player)

    if phone == nil then
        player:Say("Not playing 'Alice in Zomboidland' anymore...")
        player_data.SetPlaying(player, false)
    else
        player:Say("Playing 'Alice in Zomboidland' ! Need to check my Visa expiration time !")
        player_data.SetPlaying(player, true)
    end

end


---@param player AliasPlayer
---@param item AliasItem
local function OnWearItem(player, item)
    print("AIZ: On Wear Item")
    if  item == nil then return end

    if item:getFullType() == constants.Phone then
        CheckIfPlayingMod(player)
    end
end




local function Init()
    Events.OnTick.Remove(Init);
    local player = getPlayer()
    CheckIfPlayingMod(player)
    print("AIZ: First Tick")
end

--local function ClothingUpdated(player)
--    CheckIfPlayingMod(player)
--    print("AIZ: ClothingUpdated")
--end

--Events.EveryOneMinute.Add(EveryOneMinute)
--Events.OnClothingUpdated.Add(ClothingUpdated);
Events.AIZ_OnWearItem.Add(OnWearItem);
Events.AIZ_OnUnequipItem.Add(OnWearItem);
Events.OnTick.Add(Init);