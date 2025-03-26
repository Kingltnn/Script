

getgenv().Configuration = {
    ['Auto Mail'] = {
        ['Items'] = {
            ['Lootbox'] = {
                ['Lucky Gift'] = { ['Amount'] = 15 },
                ['Mega Enchant Chest'] = { ['Amount'] = 1 },
                ['Mega Potion Chest'] = { ['Amount'] = 1 },
                ['Mega Ultimate Chest'] = { ['Amount'] = 1 },
                ['Mega Charm Chest'] = { ['Amount'] = 1 },
            },
            ['Misc'] = {
                ['Leprechaun Key'] = { ['Amount'] = 50 },
                ['Lucky Raid Boss Key'] = { ['Amount'] = 500 },
            },
            ["Currency"] = {
                ["Diamonds"] = { ['Amount'] = 100000000 },
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
            ['Max Difficulty'] = 5000,
            ['Max Raid Time'] = 60,
            ['Egg Multiplier'] = 300,
            ['Raid Bosses'] = {true, true, false}, -- Enabled, Heroic, Use Required Item Doors
            ['Leave Breakables'] = {"LuckyRaidMassiveChest", "LuckyRaidPotOfGoldChest"}, -- LuckyRaidMediumChest, etc
        },
        ['Craft Gift'] = true,
        ['Upgrades'] = {  "LuckyRaidPets", "LuckyRaidDamage","LuckyRaidXP", "LuckyRaidAttackSpeed" },
    },
    ['Debug'] = {},
    ['Equip Enchants'] = {},
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b0dec084ff36c27d9dc119ad6b094544.lua"))()
