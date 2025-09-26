-- Minimal loader for Plant Vs Brainrot (no key UI)
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local isDestroyed = false

-- Only Plant Vs Brainrot
local games = {
    [127742093697776] = '48723aaade2692a66843c3f269c123e7', -- Plant Vs Brainrot
}

local script_id = games[game.PlaceId]
if not script_id then
    WindUI:Notify({
        Title = "Unsupported game",
        Content = "Game is not supported!",
        Duration = 5,
        Icon = "info",
    })
    return
end

-- Load Luarmor API (keeps API.load_script available)
local API = loadstring(game:HttpGet('https://sdkapi-public.luarmor.net/library.lua'))()
API.script_id = script_id

-- Bypass the key system entirely by setting a dummy key
script_key = "FREEPASS"

-- If you want to completely avoid any luarmor network calls,
-- comment out the next line and manually require/run the payload instead
API.load_script()
