---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Robin.
--- DateTime: 2/9/2022 12:08 AM
---
--
--local original_addDynamicalContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu
--
--function ISInventorPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
--    if selectedItem:getFullType() == "AIZ.Phone" then
--        --local playerObj = getSpecificPlayer(player);
--        --
--        --#if playerObj:isEquipped(selectedItem) then
--        if selectedItem:isEquipped() then
--            local option = context:addOption("Unequip Phone", selectedItem, ISInventoryPaneContextMenu.unequipItem, player)
--        else
--            local option = context:addOption("Equip Phone", selectedItem, ISInventoryPaneContextMenu.wearItem, player)
--        end
--    end
--
--    original_addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
--end

local function CheckIfPlayingMod(player)

    if player == nil then
        return
    end

    local phone = AIZ.Shared.Utils.Inventory.GetEquippedPhone(player)

    if phone == nil then
        player:Say("Not playing AIZ anymore...")
    else
        player:Say("Playing AIZ... Need to check my Visa expiration time !")
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