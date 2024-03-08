events:on("OnPlayerDeath", function(playerid, attackerid, assisterid, assistedflash, weapon, headshot, dominated, revenge, wipe, penetrated, noreplay, noscope, thrusmoke, attackerblind, distance, dmg_health, dmg_armor, hitgroup)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", attackerid, "killscreen") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", attackerid, "killscreen") == 1 then
                local killscreen = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", attackerid, "killscreen")
                if type(killscreen) ~= "number" then killscreen = tonumber(killscreen) end
                local attacker = GetPlayer(attackerid)
                if not attacker then return end
                if attacker:IsFakeClient() == 1 then return end

                attacker:SetHealthShotBoostEffectExpirationTime(server:GetCurrentTime() + 1)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "killscreen", "swiftly_vip_killscreen.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "killscreen")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Defuse Kit"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end