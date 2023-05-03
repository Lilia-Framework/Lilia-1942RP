local PLUGIN = PLUGIN

PLUGIN.Ranks = {
    root = true,
    superadmin = true,
    communitymanager = true,
    headadmin = true,
    headgm = true,
    senioradmin = true
}

function PLUGIN:SaveData()
    self:setData(self.oocBans)
end

function PLUGIN:LoadData()
    self.oocBans = self:getData()
end

function PLUGIN:InitializedPlugins()
    SetGlobalBool("oocblocked", false)
end

nut.command.add("banooc", {
    syntax = "<string target>",
    onRun = function(client, arguments)
        local target = nut.command.findPlayer(client, arguments[1]) or client
        local uniqueID = client:GetUserGroup()

        if not PLUGIN.Ranks[uniqueID] then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if target then
            PLUGIN.oocBans[target:SteamID()] = true
            client:notify(target:Name() .. " has been banned from OOC.")
        else
            client:notify("Invalid target.")
        end
    end
})

nut.command.add("unbanooc", {
    syntax = "<string target>",
    onRun = function(client, arguments)
        local target = nut.command.findPlayer(client, arguments[1]) or client
        local uniqueID = client:GetUserGroup()

        if not PLUGIN.Ranks[uniqueID] then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if target then
            PLUGIN.oocBans[target:SteamID()] = nil
            client:notify(target:Name() .. " has been unbanned from OOC.")
        end
    end
})

nut.command.add("blockooc", {
    syntax = "<string target>",
    onRun = function(client, arguments)
        local uniqueID = client:GetUserGroup()

        if not PLUGIN.Ranks[uniqueID] then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if GetGlobalBool("oocblocked", false) then
            SetGlobalBool("oocblocked", false)
            client:notify("Unlocked OOC!")
        else
            SetGlobalBool("oocblocked", true)
            client:notify("Blocked OOC!")
        end
    end
})