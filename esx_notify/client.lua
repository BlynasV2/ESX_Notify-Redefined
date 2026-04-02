local ESX = exports['es_extended']:getSharedObject()
local settings = {}
local previewActive = false
local lastNotification = 0

Citizen.CreateThread(function()
    while ESX == nil do Citizen.Wait(100) end

    local saved = GetResourceKvpString('notify_settings')
    if saved then
        settings = json.decode(saved)
    else
        settings = { 
            position = Config.DefaultPosition, 
            soundOn = Config.DefaultSound 
        }
        SetResourceKvp('notify_settings', json.encode(settings))
    end

    Citizen.Wait(500)
    SendNUIMessage({
        action = "setInitialPosition",
        position = settings.position
    })
end)

local function saveSettings(newSettings)
    settings = newSettings
    SetResourceKvp('notify_settings', json.encode(settings))
end

RegisterCommand('notify-settings', function()
    print("^2[Notify]^7 Settings command executed")

    previewActive = true

    SendNUIMessage({
        action   = "openSettings",
        position = settings.position,
        soundOn  = settings.soundOn,
        locale   = Config.Locales[Config.Locale]
    })

    SetNuiFocus(true, true)

    Citizen.Wait(300)
    SendNUIMessage({
        action  = "showPreviewNotification",
        message = Config.Locales[Config.Locale].preview_message
    })
end, false)

RegisterNetEvent('esx:showNotification')
AddEventHandler('esx:showNotification', function(message, type)
    if previewActive then return end
    TriggerEvent('esx_notify:send', message, type or 'info')
end)

exports('Notify', function(notifyType, length, message)
    if previewActive then return end
    TriggerEvent('esx_notify:send', message or "Pranešimas", notifyType or 'info')
end)

RegisterNetEvent('esx_notify:send')
AddEventHandler('esx_notify:send', function(message, type)
    local time = GetGameTimer()
    if time - lastNotification < 400 then return end
    lastNotification = time

    SendNUIMessage({
        action  = "showNotification",
        message = message,
        type    = type
    })

    if settings.soundOn then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end
end)

RegisterNUICallback('saveSettings', function(data, cb)
    saveSettings({ position = data.position, soundOn = data.soundOn })
    previewActive = false
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('closeSettings', function(data, cb)
    previewActive = false
    SetNuiFocus(false, false)
    cb('ok')
end)