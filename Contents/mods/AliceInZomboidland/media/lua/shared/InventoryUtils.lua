---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Robin.
--- DateTime: 2/9/2022 11:48 PM
---
local sharedConstants = require('Constants')

local InventoryUtils = {}

InventoryUtils.IsPhone = function(item)
    return item:getFullType() == sharedConstants.Phone
end

InventoryUtils.IsCard = function(item)
    return item:getFullType() == sharedConstants.Card
end

InventoryUtils.IsVisa = function(item)
    return item:getFullType() == sharedConstants.Visa
end

---@param player AliasPlayer
InventoryUtils.GetEquippedPhone = function(player)
    ---@type IsoPlayer | IsoGameCharacter | IsoGameCharacter | IsoLivingCharacter | IsoMovingObject player
    local p = player
    local phones = p:getInventory():FindAll(sharedConstants.Phone)

    for i = 0, phones:size()-1 do
        ---@type InventoryItem
        local phone = phones:get(i)

        if phone:isEquipped() then
            return phone
        end
    end

    return nil
end


InventoryUtils.DoesPhoneAcceptItem = function(item)
    if item == nil then return false end
    return InventoryUtils.IsVisa(item) or InventoryUtils.IsCard(item)
end

return InventoryUtils