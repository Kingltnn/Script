
getgenv().Configuration = { -- This script does NOT hatch eggs ONLY digsite
    ['Auto Mail'] = {
        ['Items'] = {
            ['Currency'] = {
                ['Diamonds'] = { ['Amount'] = 100000000 },
            },
            ['Misc'] = {
                ['Ruby Gem'] = { ['Amount'] = 20000 },
                ['Sapphire Gem'] = { ['Amount'] = 150000 },
                ['Emerald Gem'] = { ['Amount'] = 1000 },
                ['Amethyst Gem'] = { ['Amount'] = 300 },
                ['Rainbow Gem'] = { ['Amount'] = 100 },
            },
        },
        ['Mail All Huges'] = true,
        ['Usernames'] = {"letunamrb"},
    },
    ["Webhook"] = {
        ["UserID"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1279722812931575851/G30w5whctavJ7ABeLBE0ZCFgxegLu-PHd9HMex-748vLqJ6tLK-QdicuAiY0Xqm8wRwo",
    },
    ['Event'] = {
        ['Desired Area'] = 3,
        ['Max Break Time'] = 60, -- Priority Bypasses
        ['Priority Blocks'] = {"Sapphire","Ruby","Emerald","Amethyst", "Rainbow"},
        ['Upgrades'] = {},
    },
    ['Consumables'] = { ["Mining Damage Booster"] = 1, ["Mining Speed Booster"] = 1, },
    ['Debug'] = {},
    --[[ IF OPT DO NOT COMPLAIN ABOUT DEBRIS LOCK THING NOT ISSUE ]]
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/06b65bbac4b00bb34141dfc01d201acd.lua"))()
