repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Config = {
    --Hatch MODE-- IF U SET 2 OR MORE = TRUE THEN ITS WILL INSTA KICK YOU
    ["AutoHatchEggHuntEvent"] = true,
    ----ONLY TURN ON 1 OF THEM to true ----
    ["AutoHatchBestEgg"] = false,
    ----ONLY TURN ON 1 OF THEM to true ----
    ["AutoHatchDailyBountyMythic"] = false,
    ----ONLY TURN ON 1 OF THEM to true ----
    ["SelectedEgg"] = "Infinity Egg",
    ["AutoHatchSelectedEgg"] = false,
    ----ONLY TURN ON 1 OF THEM to true ----
    ["AutoRiftEggLuckHatch"] = true,
    ["FindRiftEggChance"] = 25, -- ✅ Chỉ chọn rift có luck ≤ 25 (x25 trở xuống)
    ----ONLY TURN ON 1 OF THEM to true ----



    -- 🧪 Buffs & Performance
    ["UsePotions"] = true,
    ["Coins"] = true,
    ["Lucky"] = true,
    ["Speed"] = true,
    ["SetFPS"] = 60,

    -- Misc
    ["AutoCheckInventoryFull"] = true,
    ["AutoDeleteByChanceEnabled"] = true,
    ["AutoDeleteIfChanceBelow"] = 50, -- xoá nếu pet hiếm hơn 1 in 200 (0.5%), updated its will not delete secret / mythic even the chance is below
    ["WhiteScreen"] = false,
    ["NotifyAvernusToWebhook"] = true,

    -- 🌐 Webhook
    ["WebhookPetAndAuraEgg"] = {
        ["PingUserId"] = "",
        ["WebhookURL"] = "https://discord.com/api/webhooks/1364553951365697667/sl28APiXDUcPktzZ9PgxRPRk7WGG-ZonkfrMTClAJ_qQhVlKvoCRfOLSvF6qt5_-ksZY",
        ["WebhookRaritySender"] = {
            ["Common"] = false,
            ["Unique"] = false,
            ["Rare"] = false,
            ["Epic"] = false,
            ["Legendary"] = true,
            ["Mythic"] = true,
            ["Secret"] = true,
        }
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/StrenTheBeginner/asenranhroi/refs/heads/main/Kaitun-BGSI-V3"))()
