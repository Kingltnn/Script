getgenv().Configuration = {
    ['Auto Mail'] = {
        ['Items'] = {
            ['Lootbox'] = {
                ['Lucky Gift'] = { ['Amount'] = 10 },
            },
            ['Misc'] = {
                ['Leprechaun Key'] = { ['Amount'] = 50 },
                ['Lucky Raid Boss Key'] = { ['Amount'] = 50 },
            },
        },
        ['Mail All Huges'] = true,
        ['Usernames'] = { "letunamrb" },
    },
    ["Webhook"] = {
        ["UserID"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1279722812931575851/G30w5whctavJ7ABeLBE0ZCFgxegLu-PHd9HMex-748vLqJ6tLK-QdicuAiY0Xqm8wRwo",
    },
    ['Event'] = {
        ['Raid Settings'] = {
            ['Enabled'] = true,
            ['Max Difficulty'] = math.huge,
            ['Egg Multiplier'] = 500,
            ['Raid Bosses'] = {true, true, true}, -- Enabled, Heroic, Use Required Item Doors
            ['Leave Breakables'] = {"LuckyRaidBigChest"}, -- LuckyRaidMediumChest, etc
        },
        ['Craft Gift'] = true,
        ['Upgrades'] = { "LuckyRaidDamage", "LuckyRaidXP",  "LuckyRaidAttackSpeed" },
    },
    
    ['Debug'] = {},
    ['Equip Enchants'] = {},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b0dec084ff36c27d9dc119ad6b094544.lua"))()
