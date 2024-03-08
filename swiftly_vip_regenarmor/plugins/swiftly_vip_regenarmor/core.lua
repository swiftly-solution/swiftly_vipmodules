events:on("OnPlayerDeath", function(playerid, attackerid, assisterid, assistedflash, weapon, headshot, dominated, revenge, wipe, penetrated, noreplay, noscope, thrusmoke, attackerblind, distance, dmg_health, dmg_armor, hitgroup)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", attackerid, "regenarmor") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", attackerid, "regenarmor") == 1 then
                local regenarmor = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", attackerid, "regenarmor")
                if type(regenarmor) ~= "number" then regenarmor = tonumber(regenarmor) end
                local attacker = GetPlayer(attackerid)
                if not attacker then return end
                if attacker:IsFakeClient() == 1 then return end

                local CurrentHealth = attacker:armor():Get()
                if CurrentHealth >= 100 then 
                    return
                else
                    attacker:armor():Set(CurrentHealth + regenarmor)
                end
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "regenarmor", "swiftly_vip_regenarmor.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "regenarmor")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Regen Armor (Per Kill)"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end