-- Nguyen BaKhí Hub (Steal an Egg - v92.0 Train, Ghost Soul & Mansion Key Edition)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

pcall(function()
    if PlayerGui:FindFirstChild("NguyenBaKhiVenture") then
        PlayerGui.NguyenBaKhiVenture:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBaKhiVenture"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- NÚT AVATAR TRÒN THU GỌN MENU CHÍNH
local FloatAvatarBtn = Instance.new("ImageButton")
FloatAvatarBtn.Size = UDim2.new(0, 42, 0, 42)
FloatAvatarBtn.Position = UDim2.new(0, 15, 0, 130)
FloatAvatarBtn.BackgroundColor3 = Color3.fromRGB(25, 12, 20)
FloatAvatarBtn.Visible = false
FloatAvatarBtn.Draggable = true
FloatAvatarBtn.ZIndex = 50
FloatAvatarBtn.Parent = ScreenGui
Instance.new("UICorner", FloatAvatarBtn).CornerRadius = UDim.new(1, 0)

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Color3.fromRGB(255, 110, 190)
AvatarStroke.Thickness = 2
AvatarStroke.Parent = FloatAvatarBtn

pcall(function()
    local thumbSuccess, content = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    end)
    FloatAvatarBtn.Image = thumbSuccess and content or "rbxassetid://6031094678"
end)

-- ==========================================
-- 1. BẢNG CHỌN NGÔN NGỮ TÁCH BIỆT HOÀN TOÀN
-- ==========================================
local LangModal = Instance.new("Frame")
LangModal.Size = UDim2.new(0, 360, 0, 200)
LangModal.Position = UDim2.new(0.5, -180, 0.5, -100)
LangModal.BackgroundColor3 = Color3.fromRGB(18, 10, 15)
LangModal.BackgroundTransparency = 0.05
LangModal.Active = true
LangModal.Draggable = true
LangModal.ZIndex = 60
LangModal.Parent = ScreenGui

Instance.new("UICorner", LangModal).CornerRadius = UDim.new(0, 12)
local LangStroke = Instance.new("UIStroke")
LangStroke.Thickness = 2.5
LangStroke.Parent = LangModal

task.spawn(function()
    local hue = 0
    while LangModal and LangModal.Parent do
        hue = (hue + 0.005) % 1
        LangStroke.Color = Color3.fromHSV(hue, 0.8, 1)
        task.wait(0.03)
    end
end)

local LangTitle = Instance.new("TextLabel")
LangTitle.Size = UDim2.new(1, 0, 0, 35)
LangTitle.Position = UDim2.new(0, 0, 0, 6)
LangTitle.BackgroundTransparency = 1
LangTitle.Text = "👑 Nguyen BaKhí Hub - Language"
LangTitle.TextColor3 = Color3.fromRGB(255, 130, 200)
LangTitle.TextSize = 12
LangTitle.Font = Enum.Font.FredokaOne
LangTitle.ZIndex = 61
LangTitle.Parent = LangModal

local function createLangButton(textStr, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 30)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(190, 40, 70)
    btn.Text = textStr
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 9
    btn.Font = Enum.Font.FredokaOne
    btn.ZIndex = 62
    btn.Parent = LangModal
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function()
        LangModal:Destroy()
        MainFrame.Visible = true
        QuickStealBtn.Visible = true
        OpenEggInfoBtn.Visible = true
        callback()
    end)
end

createLangButton("🇻🇳  TIẾNG VIỆT", 66, function() print("Language: Tiếng Việt") end)
createLangButton("🇬🇧  ENGLISH", 102, function() print("Language: English") end)

-- ==========================================
-- 2. NÚT BẤM NỔI ĐỘC LẬP NGOÀI MÀN HÌNH
-- ==========================================
local QuickStealBtn = Instance.new("TextButton")
QuickStealBtn.Size = UDim2.new(0, 140, 0, 32)
QuickStealBtn.Position = UDim2.new(0, 15, 0, 180)
QuickStealBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 100)
QuickStealBtn.Text = "⚡ TỰ ĐỘNG LẤY TRỨNG"
QuickStealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickStealBtn.TextSize = 8
QuickStealBtn.Font = Enum.Font.FredokaOne
QuickStealBtn.Visible = false
QuickStealBtn.Draggable = true
QuickStealBtn.ZIndex = 40
QuickStealBtn.Parent = ScreenGui
Instance.new("UICorner", QuickStealBtn).CornerRadius = UDim.new(0, 8)

local isQuickStealActive = false
QuickStealBtn.MouseButton1Click:Connect(function()
    isQuickStealActive = not isQuickStealActive
    if isQuickStealActive then
        QuickStealBtn.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
        QuickStealBtn.Text = "✅ Đang Lấy Trứng..."
    else
        QuickStealBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 100)
        QuickStealBtn.Text = "⚡ TỰ ĐỘNG LẤY TRỨNG"
    end
end)

local OpenEggInfoBtn = Instance.new("TextButton")
OpenEggInfoBtn.Size = UDim2.new(0, 140, 0, 32)
OpenEggInfoBtn.Position = UDim2.new(0, 15, 0, 220)
OpenEggInfoBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 180)
OpenEggInfoBtn.Text = "📖 XEM PET & TRỨNG NỞ"
OpenEggInfoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenEggInfoBtn.TextSize = 8
OpenEggInfoBtn.Font = Enum.Font.FredokaOne
OpenEggInfoBtn.Visible = false
OpenEggInfoBtn.Draggable = true
OpenEggInfoBtn.ZIndex = 40
OpenEggInfoBtn.Parent = ScreenGui
Instance.new("UICorner", OpenEggInfoBtn).CornerRadius = UDim.new(0, 8)

-- ==========================================
-- 3. BẢNG XEM PET & TRỨNG NỞ TÁCH BIỆT
-- ==========================================
local EggInfoPanel = Instance.new("Frame")
EggInfoPanel.Size = UDim2.new(0, 260, 0, 260)
EggInfoPanel.Position = UDim2.new(1, -275, 0, 80)
EggInfoPanel.BackgroundColor3 = Color3.fromRGB(20, 10, 16)
EggInfoPanel.BackgroundTransparency = 0.15
EggInfoPanel.Visible = false
EggInfoPanel.Draggable = true
EggInfoPanel.ZIndex = 50
EggInfoPanel.Parent = ScreenGui

Instance.new("UICorner", EggInfoPanel).CornerRadius = UDim.new(0, 10)
local EggInfoStroke = Instance.new("UIStroke")
EggInfoStroke.Color = Color3.fromRGB(255, 150, 210)
EggInfoStroke.Thickness = 2
EggInfoStroke.Parent = EggInfoPanel

local EggInfoTitle = Instance.new("TextLabel")
EggInfoTitle.Size = UDim2.new(1, -30, 0, 30)
EggInfoTitle.Position = UDim2.new(0, 8, 0, 0)
EggInfoTitle.BackgroundTransparency = 1
EggInfoTitle.Text = "📖 TRA CỨU PET & TRỨNG NỞ"
EggInfoTitle.TextColor3 = Color3.fromRGB(255, 200, 230)
EggInfoTitle.TextSize = 8.5
EggInfoTitle.Font = Enum.Font.FredokaOne
EggInfoTitle.TextXAlignment = Enum.TextXAlignment.Left
EggInfoTitle.ZIndex = 51
EggInfoTitle.Parent = EggInfoPanel

local CloseEggPanel = Instance.new("TextButton")
CloseEggPanel.Size = UDim2.new(0, 22, 0, 22)
CloseEggPanel.Position = UDim2.new(1, -26, 0, 4)
CloseEggPanel.BackgroundColor3 = Color3.fromRGB(230, 50, 100)
CloseEggPanel.Text = "X"
CloseEggPanel.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseEggPanel.TextSize = 8.5
CloseEggPanel.Font = Enum.Font.FredokaOne
CloseEggPanel.ZIndex = 51
CloseEggPanel.Parent = EggInfoPanel
Instance.new("UICorner", CloseEggPanel).CornerRadius = UDim.new(0, 5)

CloseEggPanel.MouseButton1Click:Connect(function()
    EggInfoPanel.Visible = false
end)

OpenEggInfoBtn.MouseButton1Click:Connect(function()
    EggInfoPanel.Visible = not EggInfoPanel.Visible
end)

local EggInfoDesc = Instance.new("TextLabel")
EggInfoDesc.Size = UDim2.new(1, -16, 1, -40)
EggInfoDesc.Position = UDim2.new(0, 8, 0, 34)
EggInfoDesc.BackgroundTransparency = 1
EggInfoDesc.Text = "• [1] Halloween Egg (Khu vực Halloween)\n  └ Pet: Ghost Bunny (Godly)\n  └ Kiếm được: $5.2B/s (Tỷ lệ: 1.5%)\n\n• [2] Magma Egg (Khu vực Lửa)\n  └ Pet: Inferno Phoenix (Secret)\n  └ Kiếm được: $1.8B/s (Tỷ lệ: 0.5%)\n\n• [3] Dragon Egg (Khu vực Thường)\n  └ Pet: Fire Drake (Epic)\n  └ Kiếm được: $850M/s (Tỷ lệ: 45%)"
EggInfoDesc.TextColor3 = Color3.fromRGB(230, 215, 225)
EggInfoDesc.TextSize = 7.5
EggInfoDesc.Font = Enum.Font.GothamSemibold
EggInfoDesc.TextXAlignment = Enum.TextXAlignment.Left
EggInfoDesc.TextYAlignment = Enum.TextYAlignment.Top
EggInfoDesc.ZIndex = 51
EggInfoDesc.Parent = EggInfoPanel

-- ==========================================
-- 4. GIAO DIỆN CHÍNH (VENYX X CHILLI NEW)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 680, 0, 380)
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 10, 16)
MainFrame.BackgroundTransparency = 0.25
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.ZIndex = 10
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2.5
MainStroke.Parent = MainFrame

local isRainbowTheme = true
task.spawn(function()
    local hue = 0
    while MainFrame and MainFrame.Parent do
        if isRainbowTheme then
            hue = (hue + 0.005) % 1
            local rainbowColor = Color3.fromHSV(hue, 0.8, 1)
            MainStroke.Color = rainbowColor
            AvatarStroke.Color = rainbowColor
        end
        task.wait(0.03)
    end
end)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 12, 20)
TopBar.BackgroundTransparency = 0.2
TopBar.ZIndex = 11
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local LogoBox = Instance.new("Frame")
LogoBox.Size = UDim2.new(0, 180, 0, 26)
LogoBox.Position = UDim2.new(0, 8, 0.5, -13)
LogoBox.BackgroundColor3 = Color3.fromRGB(38, 15, 28)
LogoBox.ZIndex = 12
LogoBox.Parent = TopBar
Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(1, 0)

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = " V  Venyx x Nguyen BaKhí"
LogoText.TextColor3 = Color3.fromRGB(255, 255, 
    
