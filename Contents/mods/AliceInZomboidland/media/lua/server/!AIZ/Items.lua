---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---

local Items = {}

local inventory_utils = AIZ.Shared.Utils.Inventory

function Items.AcceptItemFunction_Phone(container, item)
    ---@type InventoryItem
    local it = item
    return inventory_utils.DoesPhoneAcceptItem(it)
end

return Items