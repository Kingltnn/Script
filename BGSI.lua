repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Config = {
    ["AutoBlowBubble"] = true,
    ["AutoSellBubble"] = true,
    ["AutoBuyGum"] = true,
    ["AutoHatchEggs"] = false,
    ["AutoUnlockIslands"] = true,
    ["AutoEquipBestPets"] = true,
    ["AutoClaimRewards"] = true,
    ["AutoUpgradeMasteryAndClaim"] = false,
    ["AutoClaimSeason"] = true,
    ["AutoHatchSelectedEgg"] = false,
    ["AutoRiftEggLuckHatch"] = true,
    ["AutoCheckInventoryFull"] = true,
    ["TURNOFF3DRENDER"] = false,
    ["UsePotions"] = true,
    ["SelectedEgg"] = "Common Egg",
    ["ESpamDuration"] = 3,
    ["MaxHatchAttempts"] = 100,
    ["IslandUnlockAttempts"] = 2,
    ["SetFPS"] = 60,
    ["SetDefaultEggToHatch"] = false,

    ["WebhookPet"] = {
        ["PingUserId"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1335784018360406046/q0NywBiu-N48kYqYEwOUt8ZOdTVOTVQy25QhFGn9ugiIpgFOAdNkfKYlg5jtOMLKGYBk",
        ["WebhookRaritySender"] = {
            ["Common"] = false,
            ["Unique"] = false,
            ["Rare"] = false,
            ["Epic"] = false,
            ["Legendary"] = true,
            ["Mythic"] = true,
            ["Secret"] = true
        }
    },

    ["AutoDeleteRarityList"] = {
        ["Common"] = true,
        ["Unique"] = true,
        ["Rare"] = true,
        ["Epic"] = true,
        ["Legendary"] = false,
        ["Secret"] = false
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/StrenTheBeginner/asenranhroi/refs/heads/main/Kaitun-BGSI-V2"))()
