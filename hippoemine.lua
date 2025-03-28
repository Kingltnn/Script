getgenv().Configuration = { -- This script does NOT hatch eggs ONLY digsite
    ['Auto Mail'] = {
        ['Items'] = {
            ['Currency'] = {
                ['Diamonds'] = { ['Amount'] = 50000000 },
            },
            ['Misc'] = {
                ['Ruby Gem'] = { ['Amount'] = 20000 },
                ['Sapphire Gem'] = { ['Amount'] = 150000 },
                ['Emerald Gem'] = { ['Amount'] = 1000 },
                ['Amethyst Gem'] = { ['Amount'] = 300 },
                ['Rainbow Gem'] = { ['Amount'] = 10 },
            },
        },
        ['Mail All Huges'] = false,
        ['Usernames'] = {"letunamrb"},
    },
    ['Event'] = {
        ['Max Break Time'] = 600, -- Priority Bypasses
        ['Priority Blocks'] = {"Emerald", "Amethyst", "Rainbow"},
    },
    ['Consumables'] = { ["Mining Damage Booster"] = 25, ["Mining Speed Booster"] = 25,["Mining Coin Booster"] = 25, },
    ['Debug'] = {true, true, false, false}, -- Opt, Menu, Print, Block Transparency
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/06b65bbac4b00bb34141dfc01d201acd.lua"))()
