getgenv().Configuration = {
    ['Auto Mail'] = {
        ["Items"] = {
            ['Lootbox'] = {
                ['Lucky Gift'] = { Amount = 15 },
            },
            ['Egg'] = {
                ['Huge Machine Egg 5'] = { Amount = 1 },
            },
            ['Misc'] = {
                ['Leprechaun Key'] = { Amount = 1 }, 
            }
        },
        ["Mail All Huges"] = false,
        ["Usernames"] = {""},
    },
    ["Webhook"] = {
        ["UserID"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1279722812931575851/G30w5whctavJ7ABeLBE0ZCFgxegLu-PHd9HMex-748vLqJ6tLK-QdicuAiY0Xqm8wRwo",
    },
    ['Event'] = {
        ['Upgrades'] = {
            "LuckyRaidPets",
            "LuckyRaidXP",
            "LuckyRaidDamage",
            "LuckyRaidAttackSpeed",
            "LuckyRaidHugeChest",
            "LuckyRaidTitanicChest",
            "LuckyRaidBetterLoot",
        },
        ['Max Difficulty'] = math.huge,
        ['Max Hatch Time'] = 600, -- Seconds
        ['Min Egg Multiplier'] = 40,
    },
	['Debug'] = {}
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/009d6067a293590c0f76ad704c24673b.lua"))()
