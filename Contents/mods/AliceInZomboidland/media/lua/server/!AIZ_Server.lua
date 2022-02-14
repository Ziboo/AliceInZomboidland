---
--- Created by Robin.
--- DateTime: 2/8/2022 11:06 PM
---


AIZMod.Server = {}

AIZMod.Log("Server Init")

local function Init()
    Events.OnTick.Remove(Init);
    local player = getPlayer()
    AIZMod.Log("Server First Tick")
    print(player)
end


Events.OnTick.Add(Init);



