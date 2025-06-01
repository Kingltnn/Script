
getgenv().AutoMail = {
    ['Items'] = {
        ['Basketball Gift'] = { Class = "Misc", Amount = 70 },
    },
    ['Loop Interval'] = 60,
    ['Users'] = {"letunamrb"}, -- Does random of one
    ['Webhook URL'] = "https://discord.com/api/webhooks/1378611652231954493/Zs8_WC0TtlDQcrDQFdJzScjHBGNM31m6DZA1MkHjDAhLI1dycIVQLYLSy1hN-rdz98PB" -- **THAY THẾ BẰNG URL WEBHOOK CỦA BẠN**
}

repeat task.wait() until game:IsLoaded()
local LocalPlayer = game:GetService('Players').LocalPlayer
repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild('__INTRO')

local Client = game:GetService('ReplicatedStorage').Library.Client

local Network = require(Client.Network)
local SaveModule = require(Client.Save)
local HttpService = game:GetService('HttpService') -- Yêu cầu HttpService

-- Hàm gửi Webhook Discord
local function sendWebhook(lua, itemsSent, webhookUrl)
    if not webhookUrl or webhookUrl == "" or not HttpService then
        -- Không có URL webhook được cấu hình hoặc HttpService không khả dụng
        warn("Webhook URL không được cấu hình hoặc HttpService không khả dụng.")
        return
    end

    local embeds = {}
    local fields = {}
    local description = ""

    -- Tạo mô tả và fields cho vật phẩm đã gửi
    for itemName, itemData in pairs(itemsSent) do
        table.insert(fields, {
            name = itemName,
            value = "Số lượng: " .. itemData.Amount,
            inline = true -- Hiển thị các vật phẩm trên cùng một dòng nếu có chỗ
        })
        description = description .. "- **" .. itemName .. "**: x" .. itemData.Amount .. "\n"
    end

    local embed = {
        title = "Mail send",
        description = description,
        color = 65280, -- Màu xanh lá cây (decimal)
        fields = fields,
        footer = {
            text = "Người gửi ID: " .. LocalPlayer.UserId -- Sử dụng UserID của người chơi cục bộ
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%S%Z") -- Thời gian hiện tại
    }

    table.insert(embeds, embed)

    local payload = {lua
footer = {
    text = "Người gửi ID: " .. LocalPlayer.UserId -- Thay đổi từ LocalPlayer.Name sang LocalPlayer.UserId
},

        embeds = embeds
    }lua
-- Thay thế dòng 49 bằng dòng này trong hàm sendWebhook:
text = "Người gửi ID: " .. LocalPlayer.UserId -- Sử dụng UserID của người chơi cục bộ


    local jsonPayload = HttpService:JSONEncode(payload) -- Mã hóa payload thành JSON

    -- Gửi yêu cầu POST
    -- Giả định Network.PostAsync hoạt động giống HttpService.PostAsync
    -- Bạn có thể cần điều chỉnh tên hàm nếu module Network của bạn khác
    local success, result = pcall(Network.PostAsync, webhookUrl, jsonPayload, Enum.HttpContentType.ApplicationJson, false)

    if success then
        print("Webhook đã được gửi thành công!")
    else
        warn("Lỗi khi gửi webhook: " .. tostring(result))
    end
end


while task.wait(AutoMail['Loop Interval'] or 60) do
    local Queue = {}
  
    for Class, Items in pairs(SaveModule.Get()['Inventory']) do
        for uid, v in pairs(Items) do
            local PetCheck = (Class == "Pet") and string.find("Huge", v.id)
            local Config = false

            for Id, Info in pairs(AutoMail['Items']) do
                -- Cập nhật logic kiểm tra cấu hình để khớp với cách bạn đang lấy thông tin vật phẩm
                -- Mã gốc không sử dụng v.pt, v.sh, v.tn trong cấu hình AutoMail['Items']
                -- Nếu bạn muốn khớp chính xác hơn, bạn có thể thêm các trường này vào AutoMail['Items']
                -- hoặc điều chỉnh điều kiện kiểm tra ở đây.
                -- Hiện tại, tôi chỉ kiểm tra Id và Class
                if Id == v.id and Info.Class == Class and (Info.Amount or 0) <= (v._am or 1) then
                     Config = true break
                end
            end

            -- Logic điền vào Queue (không thay đổi)
            if Class == "Egg" or Config or PetCheck and not Queue[uid] then
                Queue[uid] = { Class = Class, Info = v }
            end
        end
    end

    for uid, Data in pairs(Queue) do
        local Unlocked = false
        local Mailed = false
        local v = Data.Info
        local receiverName = AutoMail['Users'][math.random(1, #AutoMail['Users'])] -- Lấy tên người nhận ngẫu nhiên

        if v._lk then
            while not Network.Invoke("Locking_SetLocked", uid, false)  do
                task.wait(0.1)
            end
        end

        local SendAmount = (v._am or 1)

        if Data.Class == "Currency" then
            --SendAmount = SendAmount - MailTax
            -- if u have own tax u can implement
        end

        -- Thực hiện gửi vật phẩm trong game
        local success, result = pcall(Network.Invoke, "Mailbox: Send", receiverName, "Bless", Data.Class, uid, SendAmount)

        -- Đợi 3 giây sau khi Invoke (theo mã gốc của bạn)
        task.wait(3)

        if success then
            -- Gửi vật phẩm trong game thành công, bây giờ gửi webhook
            print("Đã gửi vật phẩm trong game thành công.")
            local itemsSent = {}
            -- Sử dụng tên vật phẩm thực tế nếu có thể, nếu không sử dụng Class và uid
            -- Tạm thời sử dụng Class và uid như một định danh
            local itemNameForWebhook = Data.Class .. " (UID: " .. uid .. ")"
            -- Nếu bạn muốn tên vật phẩm từ SaveModule.Get()['Inventory'], bạn cần lấy nó ở đây
            -- Ví dụ: SaveModule.Get()['Inventory'][Data.Class][uid].id
            -- Tạm thời dùng Class làm tên
            itemNameForWebhook = Data.Class .. " (" .. v.id .. ")" -- Sử dụng v.id làm tên vật phẩm

            itemsSent[itemNameForWebhook] = { Amount = SendAmount }

            -- Gọi hàm gửi webhook
            -- Sử dụng LocalPlayer.Name làm tên người gửi (bot/script runner)
            sendWebhook(LocalPlayer.Name, itemsSent, AutoMail['Webhook URL'])

            Mailed = true
            print("Đã gửi " .. SendAmount .. "x " .. itemNameForWebhook .. " cho " .. receiverName)
        else
            warn("Lỗi khi gửi vật phẩm trong game cho " .. receiverName .. ": " .. tostring(result))
            -- Xử lý lỗi gửi vật phẩm trong game nếu cần
        end
    end

    -- task.wait() ở đầu vòng while đã tạo độ trễ giữa các lần lặp lớn.
    -- Nếu bạn muốn độ trễ giữa các lần gửi vật phẩm trong cùng một Queue,
    -- bạn có thể thêm task.wait() ở cuối vòng lặp for items in Queue.
en
