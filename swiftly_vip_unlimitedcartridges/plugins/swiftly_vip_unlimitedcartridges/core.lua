events:on("OnWeaponReload", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "unlimitedcartridges") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "unlimitedcartridges") == 1 then
                local unlimitedcartridges = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "unlimitedcartridges")
                if type(unlimitedcartridges) ~= "number" then unlimitedcartridges = tonumber(unlimitedcartridges) end
                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end

                if server:IsPistolRound() == 0 then
                    local currentweapon = player:weapons():GetWeaponFromSlot(WeaponSlot.CurrentWeapon)
                    currentweapon:SetReserveAmmo(99)
                end
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "unlimitedcartridges", "swiftly_vip_unlimitedcartridges.title")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "unlimitedcartridges")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Unlimited Cartridges"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end