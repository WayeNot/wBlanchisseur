ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while true do
        for _,v in pairs(WayeBlanch) do
        local interval = 500
        local posPlayer = GetEntityCoords(PlayerPedId())
        local point = v.point
        local dist = #(posPlayer-point)
            if dist <= 1.5 then
                Visual.Subtitle(v.text)
                if IsControlJustPressed(1, 51) then
                    OpenWayeBlanch()
                end
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(WayeBlanch) do
    local hash = GetHashKey('g_m_m_chicold_01')
    local point = v.point
    local heading = v.pointH
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        local ped = CreatePed("PED_TYPE_CIVMALE", hash, point.x, point.y, point.z, heading, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
        SetEntityInvincible(ped, true)
    end
    Wait(0)
end)