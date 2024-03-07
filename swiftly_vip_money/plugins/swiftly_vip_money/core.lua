events:on("OnPlayerSpawn", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "money") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "money") == 1 then
                local money = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "money")
                if type(money) ~= "number" then money = tonumber(money) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end
                
                if server:IsPistolRound() == 0 then
                    NextTick(function()
                        player:money():Take(-money)
                    end)
                
                end
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "money", "swiftly_vip_money.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "money")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Money"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vip_money"
end