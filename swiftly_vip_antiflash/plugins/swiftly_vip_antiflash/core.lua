events:on("OnPlayerBlind", function(playerid, attackerid, entityid, duration)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", attackerid, "antiflash") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", attackerid, "antiflash") == 1 then
                local antiflash = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", attackerid, "antiflash")
                if type(antiflash) ~= "number" then antiflash = tonumber(antiflash) end
                local attacker = GetPlayer(attackerid)
                if not attacker then return end
                if attacker:IsFakeClient() == 1 then return end

                attacker:SetFlashDuration(0.0)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "antiflash", "swiftly_vip_antiflash.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "antiflash")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] AntiFlash"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end