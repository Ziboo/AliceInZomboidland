---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Robin.
--- DateTime: 2/10/2022 9:25 AM
---

AcceptItemFunction = AcceptItemFunction or {}

local inventory_utils = require('Utils/InventoryUtils')

function AcceptItemFunction.Phone(container, item)
    ---@type InventoryItem
    local it = item
    return inventory_utils.DoesPhoneAcceptItem(it)
end
