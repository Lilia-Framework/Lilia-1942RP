--------------------------------------------------------------------------------------------------------
function DoorKickCore:CalcView(client, pos, ang)
    if client.KickingInDoor then
        local origin = pos + client:GetAngles():Forward() * -10
        local angles = (pos - origin):Angle()
        local view = {
            ["origin"] = origin,
            ["angles"] = angles
        }

        return view
    end
end
--------------------------------------------------------------------------------------------------------