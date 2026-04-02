# BlynelisV2 - Notify

## Funkcijos

- **Gražus dizainas** su apvaliais ikonų fonais
- **4 skirtingi tipai**: Success, Error, Warning, Information
- **Drag & Drop** pozicijos nustatymas
- **Išsaugoma pozicija** net po serverio restart'o
- **Lokalizacija** (Lietuvių + Anglų kalba)
- **Garsas** (įjungiama/išjungiama)
- **Preview režimas** nustatymuose
- **Suderinamas** su senais ir naujais ESX notify eventais

----------------------------

## Features

- **Beautiful design** with round icon backgrounds
- **4 different types**: Success, Error, Warning, Information
- **Drag & Drop** position setting
- **Saves position** even after server restart
- **Localization** (Lithuanian + English)
- **Sound** (on/off)
- **Preview mode** in settings
- **Compatible** with old and new ESX notify events

## Preview

https://imgur.com/a/pAlupVX

## Komandos (Comands)

| Komanda              | Aprašymas                          |
|----------------------|------------------------------------|
| `/notify-settings`   | Atidaryti nustatymų meniu          |

| Command              | Description                        |
|----------------------|------------------------------------|
| `/notify-settings`   | Open settings menu                 |

## Eksportai (Exports)

```lua
exports['esx_notify']:Notify('success', 5000, 'Sėkmingai atlikta!')
exports['esx_notify']:Notify('error', 5000, 'Klaida!')
