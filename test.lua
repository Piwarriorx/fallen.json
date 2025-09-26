local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local isDestroyed = false
local games = {
    [121864768012064] = '5ef4906f230aa87d747191682bd77c38', -- Fish It
    [5348290477] = '99f427dbe176af2932530ecbecb6d3dc', -- Cabin
    [127742093697776] = '48723aaade2692a66843c3f269c123e7', -- Plant Vs Brainrot
    [102234703920418] = "441b692d791ccc8add557367b35a6e2e", -- Mount Daun
    [128473079243102] = "441b692d791ccc8add557367b35a6e2e", -- Mount Arunika
    [81708893434084] = "441b692d791ccc8add557367b35a6e2e", -- Mount Yagataw
    [106525193781380] = "441b692d791ccc8add557367b35a6e2e", -- Mount Sibuatan
    [101006890582277] = "441b692d791ccc8add557367b35a6e2e", -- Sumala Expedition
    [82004947373983] = "441b692d791ccc8add557367b35a6e2e", -- Mount Yahayuk
    [123876706043500] = "441b692d791ccc8add557367b35a6e2e", -- Mount Horeg
    [138149789228609] = "441b692d791ccc8add557367b35a6e2e", -- Mount Rinjani
    [120818739452640] = "441b692d791ccc8add557367b35a6e2e", -- Mount Ckptw
    [123072895076939] = "441b692d791ccc8add557367b35a6e2e", -- Mount Haunt
    [2693023319] = "441b692d791ccc8add557367b35a6e2e", -- Expedition Antarctica
    [75188411736711] = "441b692d791ccc8add557367b35a6e2e", -- Mount Yaseterah
    [123224294054165] = "441b692d791ccc8add557367b35a6e2e", -- Mount Atin
    [123072895076939] = "441b692d791ccc8add557367b35a6e2e", -- Mount Hauk
    [73347831908825] = "441b692d791ccc8add557367b35a6e2e", -- Hell Expedition
    [108448055225264] = "441b692d791ccc8add557367b35a6e2e", -- Mount Akhirat
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

local API = loadstring(
    game:HttpGet('https://sdkapi-public.luarmor.net/library.lua')
)()
API.script_id = script_id

local closeUI = false
local adUrl = "https://ads.luarmor.net/get_key?for=FFS_Free_Keys-yTRpdogpOywa"

-- Bypass the key system by setting a fake valid key
script_key = "bypassed_key_12345"

WindUI.Services.luarmorService = {
    Name = 'Luarmor (Lootlabs)',
    Icon = 'link',
    Args = { 'ServiceId' },
    New = function(ServiceId)
        local fsetclipboard = setclipboard or toclipboard
        function ValidateKey(key)
            script_key = key
            -- Always return true to bypass validation
            return true, 'Whitelisted! (Bypassed)'
        end
        function CopyLink()
            fsetclipboard(tostring(adUrl))
        end
        return {
            Verify = ValidateKey,
            Copy = CopyLink,
        }
    end,
}

-- Skip the key UI entirely and directly load the script
API.load_script()

-- Optional: Notify that bypass was successful
WindUI:Notify({
    Title = "Key System Bypassed",
    Content = "Script loaded successfully!",
    Duration = 3,
    Icon = "success",
})
