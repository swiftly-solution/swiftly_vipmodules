events:on("OnWeaponFire", function(playerid, weapon, silenced)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "unlimitedammo") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "unlimitedammo") == 1 then
                local unlimitedammo = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "unlimitedammo")
                if type(unlimitedammo) ~= "number" then unlimitedammo = tonumber(unlimitedammo) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end

                if server:IsPistolRound() == 0 then
                    local currentweapon = player:weapons():GetWeaponFromSlot(WeaponSlot.CurrentWeapon)
                    currentweapon:SetClipAmmo(999)
                end
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "unlimitedammo", "swiftly_vip_unlimitedammo.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "unlimitedammo")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Unlimited Ammo"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end