events:on("OnPlayerSpawn", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "grenades") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "grenades") == 1 then
                local grenades = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "grenades")
                if type(grenades) ~= "number" then grenades = tonumber(grenades) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end
    
                NextTick(function()
                    player:weapons():GiveWeapons("weapon_hegrenade")
                    player:weapons():GiveWeapons("weapon_flashbang")
                    player:weapons():GiveWeapons("weapon_smokegrenade")
                    player:weapons():GiveWeapons("weapon_molotov")
                end)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "grenades", "swiftly_vip_grenades.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "grenades")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Grenades"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end