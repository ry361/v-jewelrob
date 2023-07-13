------ made by ry#7883 😵 //// love u guys ------
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(200)
    end
end)

local shops = {
    [1] = {
        ["basic_kasa"] = vector3(-626.735, -238.545, 38.057),
    },
    [2] = {
        ["basic_kasa"] = vector3(-625.697, -237.877, 38.057),
	},
    [3] = {
        ["basic_kasa"] = vector3(-626.825, -235.347, 38.057),
    },
    [4] = {
        ["basic_kasa"] = vector3(-625.77, -234.563, 38.057),
    },
    [5] = {
        ["basic_kasa"] = vector3(-627.957, -233.918, 38.057),
    },
    [6] = {
        ["basic_kasa"] = vector3(-626.971, -233.134, 38.057),
    },
    [7] = {
        ["basic_kasa"] = vector3(-624.433, -231.161, 38.057),
    },
    [8] = {
        ["basic_kasa"] = vector3(-623.045, -232.969, 38.057),
    },
    [9] = {
        ["basic_kasa"] = vector3(-620.265, -234.502, 38.057),
    },
    [10] = {
        ["basic_kasa"] = vector3(-619.225, -233.677, 38.057),
    },
    [11] = {
        ["basic_kasa"] = vector3(-620.025, -233.354, 38.057),
    },
    [12] = {
        ["basic_kasa"] = vector3(-617.487, -230.605, 38.057),
    },
	[13] = {
        ["basic_kasa"] = vector3(-618.304, -229.481, 38.057),
    },
	[14] = {
        ["basic_kasa"] = vector3(-619.741, -230.32, 38.057),
    },
    [15] = {
        ["basic_kasa"] = vector3(-619.69, -227.61, 38.057),
    },
	[16] = {
        ["basic_kasa"] = vector3(-620.481, -226.59, 38.057),
    },
    [17] = {
        ["basic_kasa"] = vector3(-621.098, -228.495, 38.057),
    },
	[18] = {
        ["basic_kasa"] = vector3(-623.855, -227.051, 38.057),
    },
	[19] = {
        ["basic_kasa"] = vector3(-624.977, -227.884, 38.057),
	},
    [20] = {
        ["basic_kasa"] = vector3(-624.056, -228.228, 38.057),
	},
}

local busy = false
Citizen.CreateThread(function()
    while true do
        local sleep = 1000  
        local playerPed = PlayerPedId()
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -596.32, -283.82, 50.3236, true ) < 2 then
            sleep = 5
            if not busy then
                DrawText3D('~INPUT_PICKUP~ Use Thermite', vector3(-595.89, -283.70, 50.99))
            end
            kasanumara = 1
            if IsControlJustPressed(0, 38) then
                if not busy then
                    ESX.TriggerServerCallback('ry-jewel:serversidecooldown2', function(atat)
                        if atat then
                            ESX.TriggerServerCallback('jewel:CheckItem', function(success)
                                if success then 
                                busy = true
                                local ped = PlayerPedId()
                                local playercoords = GetEntityCoords(ped)
                                RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
                                RequestModel("hei_p_m_bag_var22_arm_s")
                                RequestNamedPtfxAsset("scr_ornate_heist")
                                while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
                                    Citizen.Wait(50)
                                end
                                TaskGoStraightToCoord(PlayerPedId(), -596.26, -283.82, 50.3236, 1.0, -1, 299.32, 0.0)
                                Citizen.Wait(2000)
                                local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
                                local bagscene = NetworkCreateSynchronisedScene(-596.14, -283.74, 50.3236, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
                                local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -596.14, -283.74, 50.3236,  true,  true, false)
                    
                                SetEntityCollision(bag, false, true)
                                NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
                                NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
                                SetPedComponentVariation(ped, 5, 0, 0, 0)
                                NetworkStartSynchronisedScene(bagscene)
                                Citizen.Wait(1500)
                                local x, y, z = table.unpack(GetEntityCoords(ped))
                                local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)
                    
                                SetEntityCollision(bomba, false, true)
                                AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                                Citizen.Wait(2000)
                                DeleteObject(bag)
                                SetPedComponentVariation(ped, 5, 45, 0, 0)
                                DetachEntity(bomba, 1, 1)
                                FreezeEntityPosition(bomba, true)
                                TriggerServerEvent("jewel:particleserver", method)
                                SetPtfxAssetNextCall("scr_ornate_heist")
                                local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", -596.14, -282.74, 50.3236, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                    
                                
                                NetworkStopSynchronisedScene(bagscene)
                                TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
                                TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
                                Citizen.Wait(10000)
                                ClearPedTasks(ped)
                                DeleteObject(bomba)
                                StopParticleFxLooped(effect, 0)
                                TriggerServerEvent("ry-jewel:givereward2", "basic", kasanumara)
                                -- police alert here
                                selllocation()
                            else
                                Notification(Config.Notify.thermite)
                            end
                        end, 'weapon_bat')
                        end
                    end, kasanumara, "basic")
                else
                    Notification(Config.Notify.takeitslow)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

local weaponTypes = {
    ["2685387236"] = { "Unarmed", ["slot"] = 0 },
    ["3566412244"] = { "Melee", ["slot"] = 1 },
    ["-728555052"] = { "Melee", ["slot"] = 1 },
    ["416676503"] = { "Pistol", ["slot"] = 2 },
    ["3337201093"] = { "SMG", ["slot"] = 3 },
    ["970310034"] = { "AssaultRifle", ["slot"] = 4 },
    ["-957766203"] = { "AssaultRifle", ["slot"] = 4 },
    ["3539449195"] = { "DigiScanner", ["slot"] = 4 },
    ["4257178988"] = { "FireExtinguisher", ["slot"] = 0 },
    ["1159398588"] = { "MG", ["slot"] = 4 },
    ["3493187224"] = { "NightVision", ["slot"] = 0 },
    ["431593103"] = { "Parachute", ["slot"] = 0 },
    ["860033945"] = { "Shotgun", ["slot"] = 3 },
    ["3082541095"] = { "Sniper", ["slot"] = 3 },
    ["690389602"] = { "Stungun", ["slot"] = 1 },
    ["2725924767"] = { "Heavy", ["slot"] = 4 },
    ["1548507267"] = { "Thrown", ["slot"] = 0 },
    ["1595662460"] = { "PetrolCan", ["slot"] = 1 }
}

local _,wep = GetCurrentPedWeapon(playerPed)

function weaponTypeC()
	local w = GetSelectedPedWeapon(PlayerPedId())
	local wg = GetWeapontypeGroup(w)
	if weaponTypes[""..wg..""] then
		return weaponTypes[""..wg..""]["slot"]
	else
		return 0
	end
end

local ebasabilir = false
Citizen.CreateThread(function()
    while true do
        local sleep = 1000  
        local playerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(playerPed)
        kasanumara = 1
        kasa = nil
        kasaNo = nil
        for i=1, #shops do
        local basitKasaMesafe = #(PlayerCoords - shops[i]["basic_kasa"])
            if basitKasaMesafe < 0.8 then
                sleep = 5
                kasa = "basic"
                kasaNo = i
                DrawText3D('~INPUT_PICKUP~ Steal Jewels', shops[i]["basic_kasa"])
                if IsControlJustPressed(0, 38) and weaponTypeC() > 1 then
                    ESX.TriggerServerCallback('ry-jewel:serversidecooldown2', function(atat)
                        if not atat then
                            DrawText3D('~INPUT_PICKUP~ Steal Jewels', shops[i]["basic_kasa"])
                            if not ebasabilir then
                                ESX.TriggerServerCallback('ry-jewel:serversidecooldown', function(atat)
                                    if atat then
                                        ebasabilir = true
                                        animasyon(kasaNo)
                                        TriggerServerEvent("ry-jewel:givereward", "basic", kasaNo)
                                        ebasabilir = false
                                        ebasabilir = false
                                    end
                                end, kasaNo, "basic")
                            else
                                Notification(Config.Notify.thermite2)
                            end
                        end
                    end, kasanumara, "basic")
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

local vetrine = {
	{x = -626.735, y = -238.545, z = 38.057, heading = 214.907, isOpen = false},--
	{x = -625.697, y = -237.877, z = 38.057, heading = 217.311, isOpen = false},--
	{x = -626.825, y = -235.347, z = 38.057, heading = 33.745, isOpen = false},--
	{x = -625.77, y = -234.563, z = 38.057, heading = 33.572, isOpen = false},--
	{x = -627.957, y = -233.918, z = 38.057, heading = 215.214, isOpen = false},--
	{x = -626.971, y = -233.134, z = 38.057, heading = 215.532, isOpen = false},--
	{x = -624.433, y = -231.161, z = 38.057, heading = 305.159, isOpen = false},--
	{x = -623.045, y = -232.969, z = 38.057, heading = 303.496, isOpen = false},--
	{x = -620.265, y = -234.502, z = 38.057, heading = 217.504, isOpen = false},--
	{x = -619.225, y = -233.677, z = 38.057, heading = 213.35, isOpen = false},--
	{x = -620.025, y = -233.354, z = 38.057, heading = 34.18, isOpen = false},--
	{x = -617.487, y = -230.605, z = 38.057, heading = 309.177, isOpen = false},--
	{x = -618.304, y = -229.481, z = 38.057, heading = 304.243, isOpen = false},--
	{x = -619.741, y = -230.32, z = 38.057, heading = 124.283, isOpen = false},--
	{x = -619.69, y = -227.61, z = 38.057, heading = 305.245, isOpen = false},--
	{x = -620.481, y = -226.59, z = 38.057, heading = 304.677, isOpen = false},--
	{x = -621.098, y = -228.495, z = 38.057, heading = 127.046, isOpen = false},--
	{x = -623.855, y = -227.051, z = 38.057, heading = 38.605, isOpen = false},--
	{x = -624.977, y = -227.884, z = 38.057, heading = 48.847, isOpen = false},--
	{x = -624.056, y = -228.228, z = 38.057, heading = 216.443, isOpen = false},--
}


function animasyon(kasanumara)
    local playerPed = PlayerPedId()
	local playerPos = GetEntityCoords(playerPed, true)
    if kasanumara == 1 then
        SetEntityCoords(PlayerPedId(), -626.82, -238.26, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 215.73)
    elseif kasanumara == 2 then
        SetEntityCoords(PlayerPedId(), -625.94, -237.43, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 218.24)
    elseif kasanumara == 3 then
        SetEntityCoords(PlayerPedId(), -626.56, -235.73, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 34.31)
    elseif kasanumara == 4 then
        SetEntityCoords(PlayerPedId(), -625.59, -234.93, 38.0569-1)
        SetEntityHeading(PlayerPedId(), 40.3)
    elseif kasanumara == 5 then
        SetEntityCoords(PlayerPedId(), -628.29, -233.45, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 218.91)
    elseif kasanumara == 6 then
        SetEntityCoords(PlayerPedId(), -627.04, -232.84, 38.0569-1)
        SetEntityHeading(PlayerPedId(), 216.0)
    elseif kasanumara == 7 then
        SetEntityCoords(PlayerPedId(), -624.86, -231.42, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 308.77)
    elseif kasanumara == 8 then
        SetEntityCoords(PlayerPedId(), -623.33, -233.28, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 303.71)
    elseif kasanumara == 9 then
        SetEntityCoords(PlayerPedId(), -620.26, -234.38, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 218.09)
    elseif kasanumara == 10 then
        SetEntityCoords(PlayerPedId(), -619.03, -233.49, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 214.24)
    elseif kasanumara == 11 then
        SetEntityCoords(PlayerPedId(), -620.12, -233.42, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 34.49)
    elseif kasanumara == 12 then
        SetEntityCoords(PlayerPedId(), -617.70, -230.70, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 306.73)
    elseif kasanumara == 13 then
        SetEntityCoords(PlayerPedId(), -618.59, -229.74, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 306.05)
    elseif kasanumara == 14 then
        SetEntityCoords(PlayerPedId(), -619.35, -230.25, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 124.69)
    elseif kasanumara == 15 then
        SetEntityCoords(PlayerPedId(), -619.98, -227.89, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 311.56)
    elseif kasanumara == 16 then
        SetEntityCoords(PlayerPedId(), -620.61, -226.73, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 303.41)
    elseif kasanumara == 17 then
        SetEntityCoords(PlayerPedId(), -620.82, -228.30, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 130.81)
    elseif kasanumara == 18 then
        SetEntityCoords(PlayerPedId(), -623.68, -227.33, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 36.05)
    elseif kasanumara == 19 then
        SetEntityCoords(PlayerPedId(), -624.83, -228.09, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 34.98)
    elseif kasanumara == 20 then
        SetEntityCoords(PlayerPedId(), -624.16, -227.81, 38.0570-1)
        SetEntityHeading(PlayerPedId(), 216.23)
    end
    loadAnimDict('missheist_jewel')
    for i,v in pairs(vetrine) do 
        if #(playerPos - vector3(v.x, v.y, v.z)) < 0.75 then
            TaskPlayAnim(playerPed, 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
            while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                RequestNamedPtfxAsset("scr_jewelheist")
                Citizen.Wait(0)
            end
            PlaySoundFromCoord(-1, "Glass_Smash", playerPos.x, playerPos.y, playerPos.z, "", 0, 2.0, 0)
            SetPtfxAssetNextCall("scr_jewelheist")
            StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", v.x, v.y, v.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                
            Citizen.Wait(5000)
            ClearPedTasks(playerPed)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end

function DrawText3D(msg, coords)
    AddTextEntry('Text', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('Text')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
end

function Notification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end

RegisterNetEvent('servernotification')
AddEventHandler('servernotification', function(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000  
        local playerPed = PlayerPedId()
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 902.143, 3564.90, 33.7968, true ) < 4 then
            sleep = 5
            DrawText3D('~INPUT_PICKUP~ Sell Jewels', vector3(902.143, 3564.90, 33.7968+1))
            if IsControlJustPressed(0, 38) then
                ESX.TriggerServerCallback('CheckItem', function(count)
                    if count >= 1 then
                        local gidecekpara = count * Config.ItemMoney.Ring 
                        TriggerServerEvent('batuflexisiktim', gidecekpara, Config.Item.Ring, count)
                    end
                end, Config.Item.Ring)
                ESX.TriggerServerCallback('CheckItem', function(count)
                    if count >= 1 then
                        local gidecekpara = count * Config.ItemMoney.Rolex  
                        TriggerServerEvent('batuflexisiktim', gidecekpara, Config.Item.Rolex, count)
                    end
                end, Config.Item.Rolex)
                ESX.TriggerServerCallback('CheckItem', function(count)
                    if count >= 1 then
                        local gidecekpara = count * Config.ItemMoney.GB  
                        TriggerServerEvent('batuflexisiktim', gidecekpara, Config.Item.GB, count)
                    end
                end, Config.Item.GB)
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- NPC Spawn
Citizen.CreateThread(function ()
    local hash = GetHashKey('ig_oldrichguy')
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(1) end
    local ped = CreatePed(21, hash, 902.143, 3564.90, 33.7968 -1, 91.07, false, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, 0)
    SetPedDropsWeaponsWhenDead(ped, false)
    SetPedDiesWhenInjured(ped, false)
    SetEntityInvincible(ped , true)
    FreezeEntityPosition(ped, true)
    npcped = ped
    TaskStartScenarioInPlace(npcped, "WORLD_HUMAN_SMOKING", 0, 1, false)
end)

Citizen.CreateThread(function ()
    local hash = GetHashKey('u_f_y_jewelass_01')
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(1) end
    jewelped = CreatePed(21, hash, -623.39, -230.33, 38.0570 -1, 122.68, false, false)
    SetPedDropsWeaponsWhenDead(jewelped, false)
    npcped2 = jewelped
    TaskStartScenarioInPlace(npcped2, "WORLD_HUMAN_STAND_MOBILE", 0, 1, false)
end)

function selllocation()
    Citizen.Wait(300000)
    SetNewWaypoint(902.143, 3564.90)
    Notification(Config.Notify.gps)
end