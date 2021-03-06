---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Robin.
--- DateTime: 2/9/2022 11:48 PM
---
local constants = require('AIZ_Constants')

local inventory_utils = {}

---@param item AliasItem
function inventory_utils.IsPhone(item)
    return item:getFullType() == constants.PhoneFullName
end

---@param item AliasItem
function inventory_utils.IsCard(item)
    return item:getFullType() == constants.CardFullName
end

---@param item AliasItem
function inventory_utils.IsVisa(item)
    return item:getFullType() == constants.VisaFullName
end

---@param item AliasItem
function inventory_utils.GetVisaDuration(item)
    if not inventory_utils.IsVisa(item) then
        AIZMod.Warning("GetVisaDuration item is not a Visa", item)
        return -1
    end
    return item:getModData().visa_duration
end

---@param item AliasItem
function inventory_utils.SetVisaDuration(item, duration)
    if not inventory_utils.IsVisa(item) then
        AIZMod.Warning("SetVisaDuration item is not a Visa", item)
        return false
    end
    item:getModData().visa_duration = duration
    return true
end

---@param player AliasPlayer
function inventory_utils.GetEquippedPhone (player)
    local phones = player:getInventory():FindAll(constants.PhoneFullName)

    for i = 0, phones:size()-1 do
        ---@type InventoryItem
        local phone = phones:get(i)

        if phone:isEquipped() then
            return phone
        end
    end

    return nil
end

---@param item AliasItem
function inventory_utils.DoesPhoneAcceptItem(item)
    if item == nil then return false end
    return inventory_utils.IsVisa(item) or inventory_utils.IsCard(item)

end

---@param player AliasPlayer
---@param duration int
function inventory_utils.GiveVisaToPlayer(player, duration)
    local inventory = player:getInventory()
    ---@type AliasItem
    local item = inventory:AddItem(constants.VisaFullName)

    item:getModData().visa_duration = duration

    return item
end




return inventory_utils