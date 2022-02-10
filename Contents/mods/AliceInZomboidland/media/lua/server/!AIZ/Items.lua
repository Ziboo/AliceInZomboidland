local Items = {}

local inventory_utils = AIZ.Shared.Utils.Inventory

function Items.AcceptItemFunction_Phone(container, item)
    ---@type InventoryItem
    local it = item
    return inventory_utils.DoesPhoneAcceptItem(it)
end

return Items