events:on("OnPlayerSpawn", function(playerid)
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        if exports["swiftly_vipcore"]:CallExport("HasFeature", playerid, "chat") == 1 then
            if exports["swiftly_vipcore"]:CallExport("IsFeatureEnabled", playerid, "chat") == 1 then
                local chat = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "chat")
                if type(chat) ~= "number" then chat = tonumber(chat) end

                local chattag = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "chattag")
                if type(chattag) ~= "string" then chattag = tostring(chattag) end

                local chattagcolor = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "chattagcolor")
                if type(chattagcolor) ~= "string" then chattagcolor = tostring(chattagcolor) end

                local chatnamecolor = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "chatnamecolor")
                if type(chatnamecolor) ~= "string" then chatnamecolor = tostring(chatnamecolor) end

                local chattextcolor = exports["swiftly_vipcore"]:CallExport("GetFeatureValue", playerid, "chattextcolor")
                if type(chattextcolor) ~= "string" then chattextcolor = tostring(chattextcolor) end

                local player = GetPlayer(playerid)
                if not player then return end
                if player:IsFakeClient() == 1 then return end
                
                player:SetChatTag(chattag)
                player:SetTagColor(chattagcolor)
                player:SetNameColor(chatnamecolor)
                player:SetChatColor(chattextcolor)
            end
        end
    end
end)

events:on("AllPluginsLoaded", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "chat", "swiftly_vip_chat.title")
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "chattag", "swiftly_vip_chat.chattag")
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "chattagcolor", "swiftly_vip_chat.chattagcolor")
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "chatnamecolor", "swiftly_vip_chat.chatnamecolor")
        exports["swiftly_vipcore"]:CallExport("RegisterFeature", "chattextcolor", "swiftly_vip_chat.chattextcolor")
    end
end)

events:on("OnPluginStop", function()
    if GetPluginState("swiftly_vipcore") == PluginState.Started then
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "chat")
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "chattag")
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "chattagcolor")
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "chatnamecolor")
        exports["swiftly_vipcore"]:CallExport("UnregisterFeature", "chattextcolor")
    end
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "[VIP] Chat"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/swiftly_vipmodules"
end