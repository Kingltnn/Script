getgenv().Configuration = {
    ['Auto Mail'] = {
        ['Items'] = {
            ['Lootbox'] = {
                ['Lucky Gift'] = { ['Amount'] = 50 },
            },
            ['Misc'] = {
                ['Leprechaun Key'] = { ['Amount'] = 1 },
            },
        },
        ['Mail All Huges'] = false,
        ['Usernames'] = {"letunamrb"},
    },
    ["Webhook"] = {
        ["UserID"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1279722812931575851/G30w5whctavJ7ABeLBE0ZCFgxegLu-PHd9HMex-748vLqJ6tLK-QdicuAiY0Xqm8wRwo",
    },
    ['Event'] = {
        ['Raid Settings'] = {
            ['Enabled'] = false,
            ['Max Difficulty'] = 200,
            ['Egg Multiplier'] = 60,
            ['Leave Breakables'] = {"LuckyRaidBigChest"}, -- LuckyRaidMediumChest, etc
        },
        ['Craft Gifts'] = true,
        ['Upgrades'] = { "LuckyRaidPets", "LuckyRaidDamage", "LuckyRaidAttackSpeed" },
    },
    ['Equip Enchants'] = {"Strong Pets", "Criticals", "Strong Pets", "Criticals", "Strong Pets", "Strong Pets"},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b0dec084ff36c27d9dc119ad6b094544.lua"))()
 
