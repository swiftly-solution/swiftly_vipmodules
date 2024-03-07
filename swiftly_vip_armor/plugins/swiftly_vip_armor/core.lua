events:on("OnPlayerSpawn", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "armor") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "armor") == 1 then
                local armor = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "armor")
                if type(armor) ~= "number" then armor = tonumber(armor) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end

                if server:IsPistolRound() == 0 then
                    NextTick(function()
                        player:weapons():GiveWeapons("item_assaultsuit")
                    end)
                end

    
                NextTick(function()
                    player:armor():Set(armor)
                end)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "armor", "swiftly_vip_armor.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "armor")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Armor"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vip_armor"
end