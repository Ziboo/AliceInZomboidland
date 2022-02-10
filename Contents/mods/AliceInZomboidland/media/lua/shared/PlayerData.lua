---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Robin.
--- DateTime: 2/10/2022 10:39 AM
---

local PlayerData = {}

function PlayerData.GetModData(player)

    if not player:getModData().AIZ then
        player:getModData().AIZ = {}
    end

    return player:getModData().AIZ
end

function PlayerData.GetPlaying(player)
    return PlayerData.GetModData(player).is_playing
end

function PlayerData.SetPlaying(player, is_playing)
    PlayerData.GetModData(player).is_playing = is_playing
end

return PlayerData