Config = {}

Config.DefaultPosition = { x = 2, y = 45 }
Config.DefaultSound    = true
Config.Duration        = 6000
Config.MaxNotifications = 8

-- ==================== LANGUAGE ====================
Config.Locale = 'en'   -- Pakeisk į 'lt' jei nori Lietuviu kalbos.

Config.Locales = {
    ['lt'] = {
        settings_title  = "🔔 Notify Nustatymai",
        settings_desc   = "Tempk žemiau esantį pranešimą į norimą vietą",
        sound_label     = "Įjungti garsą",
        btn_save        = "Išsaugoti",
        btn_cancel      = "Atšaukti",
        preview_message = "👈 Tempk šį pranešimą į norimą vietą"
    },
    ['en'] = {
        settings_title  = "🔔 Notify Settings",
        settings_desc   = "Drag the notification below to your desired position",
        sound_label     = "Enable sound",
        btn_save        = "Save",
        btn_cancel      = "Cancel",
        preview_message = "👈 Drag this notification to the desired place"
    }
}

Config.Theme = {
    bg     = 'rgba(15, 15, 25, 0.97)',
    accent = '#4cc9f0',
    text   = '#e0f0ff',
    shadow = '0 8px 25px rgba(76, 201, 240, 0.35)'
}