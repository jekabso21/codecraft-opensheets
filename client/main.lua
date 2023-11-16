local tabEnabled = false
local tabLoaded = true
photoUrl = nil

RegisterCommand('docs', function(source, args, raw)
    TriggerEvent('codecraft:opengoogle', args[1])
end)


function NUIFOCUSFN(state, url)
    SetNuiFocus(state, state)
    if state == true then
        SendNUIMessage({ showtab = true, src = GetPlayerServerId(PlayerId()), url = url})
    else
        SendNUIMessage({ hidetab = true, src = GetPlayerServerId(PlayerId()), url = url})
    end
    return bool
end


RegisterNUICallback("NUI:close", function()
    tabEnabled = false
    NUIFOCUSFN(false)
    stopAnim()
end)

RegisterNetEvent("codecraft:opengoogle")
AddEventHandler("codecraft:opengoogle", function(url)
    tabEnabled = not tabEnabled
    if string.match(url, 'google%.com') then
        if tabEnabled then
            startAnim()
        else
            stopAnim()
        end
        NUIFOCUSFN(tabEnabled, url)
    else
        print("The provided URL does not contain 'google.com'")
    end

end)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
        while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
            Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end

function attachObject()
    tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    DeleteEntity(tab)
end

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
        while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
            Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end

function attachObject()
    tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    DeleteEntity(tab)
end
