events:on("OnPlayerSpawn", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "clantag") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "clantag") == 1 then
                local clantag = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "clantag")
                if type(clantag) ~= "string" then clantag = tostring(clantag) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end
    
                NextTick(function()
                    player:clantag():Set(clantag)
                end)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "clantag", "swiftly_vip_clantag.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "clantag")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] ClanTAG"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end