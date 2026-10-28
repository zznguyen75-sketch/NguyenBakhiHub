-- Nguyen BaKhí Hub (Steal an Egg - v81.0 Ultimate Anti-Freeze & Venyx UI Edition)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

pcall(function()
    if CoreGui:FindFirstChild("NguyenBaKhiVenture") then
        CoreGui.NguyenBaKhiVenture:Destroy()
    end
    if LocalPlayer.PlayerGui:FindFirstChild("NguyenBaKhiVenture") then
        LocalPlayer.PlayerGui.NguyenBaKhiVenture:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBaKhiVenture"
local successGui = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not successGui then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- NÚT AVATAR TRÒN THU GỌN
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

-- BẢNG CHỌN NGÔN NGỮ BAN ĐẦU
local LangModal = Instance.new("Frame")
LangModal.Size = UDim2.new(0, 360, 0, 200)
LangModal.Position = UDim2.new(0.5, -180, 0.5, -100)
LangModal.BackgroundColor3 = Color3.fromRGB(18, 10, 15)
LangModal.BackgroundTransparency = 0.05
LangModal.Active = true
LangModal.Draggable = true
LangModal.ZIndex = 20
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
LangTitle.Text = "👑 Nguyen BaKhí Hub"
LangTitle.TextColor3 = Color3.fromRGB(255, 130, 200)
LangTitle.TextSize = 13
LangTitle.Font = Enum.Font.FredokaOne
LangTitle.ZIndex = 21
LangTitle.Parent = LangModal

local LangSub = Instance.new("TextLabel")
LangSub.Size = UDim2.new(1, -20, 0, 24)
LangSub.Position = UDim2.new(0, 10, 0, 38)
LangSub.BackgroundTransparency = 1
LangSub.Text = "Vui lòng chọn ngôn ngữ / Please select language:"
LangSub.TextColor3 = Color3.fromRGB(230, 210, 220)
LangSub.TextSize = 8
LangSub.Font = Enum.Font.GothamSemibold
LangSub.ZIndex = 21
LangSub.Parent = LangModal

local function createLangButton(textStr, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 30)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(190, 40, 70)
    btn.Text = textStr
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 9
    btn.Font = Enum.Font.FredokaOne
    btn.ZIndex = 22
    btn.Parent = LangModal
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(function()
        LangModal:Destroy()
        MainFrame.Visible = true
        callback()
    end)
end

createLangButton("🇻🇳  TIẾNG VIỆT", 66, function() print("Nguyen BaKhí Hub: Tiếng Việt") end)
createLangButton("🇬🇧  ENGLISH", 102, function() print("Nguyen BaKhí Hub: English") end)

local OwnerCard = Instance.new("Frame")
OwnerCard.Size = UDim2.new(1, -40, 0, 34)
OwnerCard.Position = UDim2.new(0, 20, 0, 144)
OwnerCard.BackgroundColor3 = Color3.fromRGB(35, 14, 25)
OwnerCard.ZIndex = 21
OwnerCard.Parent = LangModal
Instance.new("UICorner", OwnerCard).CornerRadius = UDim.new(0, 8)

local OwnerStroke = Instance.new("UIStroke")
OwnerStroke.Color = Color3.fromRGB(255, 110, 190)
OwnerStroke.Thickness = 1.2
OwnerStroke.Parent = OwnerCard

local OwnerText = Instance.new("TextLabel")
OwnerText.Size = UDim2.new(1, 0, 1, 0)
OwnerText.BackgroundTransparency = 1
OwnerText.Text = "👑 OWNER: NGUYEN BAKHI"
OwnerText.TextColor3 = Color3.fromRGB(255, 210, 240)
OwnerText.TextSize = 9
OwnerText.Font = Enum.Font.FredokaOne
OwnerText.ZIndex = 22
OwnerText.Parent = OwnerCard

-- ==========================================
-- GIAO DIỆN CHÍNH (CHUẨN VENYX X CHILLI NEW)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 720, 0, 410)
MainFrame.Position = UDim2.new(0.5, -360, 0.5, -205)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 10, 18)
MainFrame.BackgroundTransparency = 0.28
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

task.spawn(function()
    local hue = 0
    while MainFrame and MainFrame.Parent do
        hue = (hue + 0.005) % 1
        local rainbowColor = Color3.fromHSV(hue, 0.8, 1)
        MainStroke.Color = rainbowColor
        AvatarStroke.Color = rainbowColor
        task.wait(0.03)
    end
end)

-- TOP BAR CHUẨN VENYX X CHILLI NEW
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 12, 22)
TopBar.BackgroundTransparency = 0.15
TopBar.ZIndex = 11
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local LogoBox = Instance.new("Frame")
LogoBox.Size = UDim2.new(0, 200, 0, 28)
LogoBox.Position = UDim2.new(0, 10, 0.5, -14)
LogoBox.BackgroundColor3 = Color3.fromRGB(40, 15, 30)
LogoBox.ZIndex = 12
LogoBox.Parent = TopBar
Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(1, 0)

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = " V  Venyx x Nguyen BaKhí"
LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoText.TextSize = 9
LogoText.Font = Enum.Font.FredokaOne
LogoText.TextXAlignment = Enum.TextXAlignment.Left
LogoText.ZIndex = 13
LogoText.Parent = LogoBox

local StatusPill = Instance.new("Frame")
StatusPill.Size = UDim2.new(0, 220, 0, 26)
StatusPill.Position = UDim2.new(0.5, -110, 0.5, -13)
StatusPill.BackgroundColor3 = Color3.fromRGB(32, 12, 24)
StatusPill.ZIndex = 12
StatusPill.Parent = TopBar
Instance.new("UICorner", StatusPill).CornerRadius = UDim.new(1, 0)
local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = Color3.fromRGB(255, 120, 190)
StatusStroke.Thickness = 1
StatusStroke.Parent = StatusPill

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 6, 0, 6)
StatusDot.Position = UDim2.new(0, 12, 0.5, -3)
StatusDot.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
StatusDot.ZIndex = 13
StatusDot.Parent = StatusPill
Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -24, 1, 0)
StatusText.Position = UDim2.new(0, 24, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Đang chạy • v81.0 Không Đứng Im"
StatusText.TextColor3 = Color3.fromRGB(230, 210, 220)
StatusText.TextSize = 8
StatusText.Font = Enum.Font.GothamBold
StatusText.ZIndex = 13
StatusText.Parent = StatusPill

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0, 140, 0, 26)
SearchBox.Position = UDim2.new(1, -175, 0.5, -13)
SearchBox.BackgroundColor3 = Color3.fromRGB(32, 12, 24)
SearchBox.PlaceholderText = "🔍 Tìm kiếm..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(180, 160, 170)
SearchBox.TextSize = 8.5
SearchBox.Font = Enum.Font.GothamSemibold
SearchBox.ZIndex = 12
SearchBox.Parent = TopBar
Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(1, 0)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -30, 0.5, -12)
CloseBtn.BackgroundColor3 = Color3.fromRGB(240, 50, 110)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 9.5
CloseBtn.Font = Enum.Font.FredokaOne
CloseBtn.ZIndex = 12
CloseBtn.Parent = TopBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    FloatAvatarBtn.Visible = true
end)

FloatAvatarBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    FloatAvatarBtn.Visible = false
end)

-- THANH TAB PHỤ NGANG PHÍA TRÊN
local SubTabBar = Instance.new("Frame")
SubTabBar.Size = UDim2.new(1, -60, 0, 26)
SubTabBar.Position = UDim2.new(0, 52, 0, 44)
SubTabBar.BackgroundTransparency = 1
SubTabBar.ZIndex = 11
SubTabBar.Parent = MainFrame

local SubTablayout = Instance.new("UIListLayout")
SubTablayout.FillDirection = Enum.FillDirection.Horizontal
SubTablayout.SortOrder = Enum.SortOrder.LayoutOrder
SubTablayout.Padding = UDim.new(0, 8)
SubTablayout.Parent = SubTabBar

local function createSubTabPill(tabName)
    local pill = Instance.new("TextButton")
    pill.Size = UDim2.new(0, 130, 1, 0)
    pill.BackgroundColor3 = Color3.fromRGB(45, 18, 32)
    pill.Text = tabName
    pill.TextColor3 = Color3.fromRGB(255, 220, 240)
    pill.TextSize = 8
    pill.Font = Enum.Font.FredokaOne
    pill.ZIndex = 12
    pill.Parent = SubTabBar
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
end

createSubTabPill("Halloween & Sao Băng")
createSubTabPill("The Hollow")
createSubTabPill("Bắt Bướm")
createSubTabPill("Admin (AA)")

-- SIDEBAR BÊN TRÁI (ICONS DỌC)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 40, 1, -74)
Sidebar.Position = UDim2.new(0, 6, 0, 72)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 10, 20)
Sidebar.BackgroundTransparency = 0.3
Sidebar.ZIndex = 11
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local SideLayout = Instance.new("UIListLayout")
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 5)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 8)
SidePadding.Parent = Sidebar

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -56, 1, -74)
ContentContainer.Position = UDim2.new(0, 52, 0, 72)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 11
ContentContainer.Parent = MainFrame

local function createTabFrame()
    local tab = Instance.new("ScrollingFrame")
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.BackgroundTransparency = 1
    tab.BorderSizePixel = 0
    tab.CanvasSize = UDim2.new(0, 0, 0, 500)
    tab.ScrollBarThickness = 2
    tab.Visible = false
    tab.ZIndex = 12
    tab.Parent = ContentContainer
    return tab
end

local HomeTab = createTabFrame()
local StealEggTab = createTabFrame()
local HalloweenTab = createTabFrame()
local ButterflyTab = createTabFrame()
local PetTab = createTabFrame()
local SpeedTab = createTabFrame()
local SettingTab = createTabFrame()

StealEggTab.Visible = true

local function addTabHeader(parent, text)
    local CatTitle = Instance.new("TextLabel")
    CatTitle.Size = UDim2.new(1, 0, 0, 22)
    CatTitle.Position = UDim2.new(0, 4, 0, 2)
    CatTitle.BackgroundTransparency = 1
    CatTitle.Text = text
    CatTitle.TextColor3 = Color3.fromRGB(255, 140, 210)
    CatTitle.TextSize = 9
    CatTitle.Font = Enum.Font.FredokaOne
    CatTitle.TextXAlignment = Enum.TextXAlignment.Left
    CatTitle.ZIndex = 13
    CatTitle.Parent = parent
end

addTabHeader(HomeTab, "Trang Chủ • Nguyen BaKhí Dashboard")
addTabHeader(StealEggTab, "Cướp Trứng • Bộ Lọc Nâng Cao & Chọn Khu Vực")
addTabHeader(HalloweenTab, "Sự Kiện • HALLOWEEN & PUMPKIN MOON")
addTabHeader(ButterflyTab, "Bắt Bướm • Mùa Bướm Nở & Máy Đổi Bướm")
addTabHeader(PetTab, "Thú Cưng • Quản lý Pet & Auto Equip")
addTabHeader(SpeedTab, "Máy Chạy Bộ • Tốc độ 795 & Auto Treadmill")
addTabHeader(SettingTab, "Cài Đặt • Tùy chỉnh Hub & Server Utility")

local function createToggle(parent, titleText, posY, callback)
    local item = Instance.new("Frame")
    item.Size = UDim2.new(1, -6, 0, 28)
    item.Position = UDim2.new(0, 0, 0, posY)
    item.BackgroundColor3 = Color3.fromRGB(30, 12, 22)
    item.BackgroundTransparency = 0.25
    item.ZIndex = 13
    item.Parent = parent
    Instance.new("UICorner", item).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -38, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = titleText
    lbl.TextColor3 = Color3.fromRGB(245, 225, 235)
    lbl.TextSize = 8
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 14
    lbl.Parent = item

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 30, 0, 14)
    toggleBtn.Position = UDim2.new(1, -34, 0.5, -7)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(55, 22, 42)
    toggleBtn.Text = ""
    toggleBtn.ZIndex = 14
    toggleBtn.Parent = item
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 10, 0, 10)
    circle.Position = UDim2.new(0, 2, 0.5, -5)
    circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    circle.ZIndex = 15
    circle.Parent = toggleBtn
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local active = false
    toggleBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 180)
            circle.Position = UDim2.new(1, -12, 0.5, -5)
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(55, 22, 42)
            circle.Position = UDim2.new(0, 2, 0.5, -5)
            circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
        pcall(function() callback(active) end)
    end)
end

-- ==========================================
-- HỆ THỐNG AN TOÀN CHỐNG ĐỨNG IM TUYỆT ĐỐI (v81.0)
-- ==========================================
_G.AutoStealEgg = false
_G.AutoCollectAll = false

task.spawn(function()
    while true do
        task.wait(0.25)
        pcall(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local hrp = char.HumanoidRootPart
            
            if _G.AutoStealEgg then
                for _, obj in ipairs(Workspace:GetChildren()) do
                    if not _G.AutoStealEgg then break end
                    if obj and string.find(string.lower(obj.Name), "egg") then
                        if obj:IsA("Model") and obj.PrimaryPart then
                            hrp.CFrame = obj.PrimaryPart.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.3)
                        elseif obj:IsA("BasePart") then
                            hrp.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.3)
                        end
                    end
                end
            end
            
            if _G.AutoCollectAll then
                for _, obj in ipairs(Workspace:GetChildren()) do
                    if not _G.AutoCollectAll then break end
                    if obj and obj:IsA("BasePart") then
                        local n = string.lower(obj.Name)
                        if string.find(n, "coin") or string.find(n, "gem") or string.find(n, "stub") then
                            hrp.CFrame = obj.CFrame
                            task.wait(0.2)
                        end
                    end
                end
            end
        end)
    end
end)

-- TAB 1: CƯỚP TRỨNG
local SLeftCol = Instance.new("Frame")
SLeftCol.Size = UDim2.new(0.49, -2, 1, -28)
SLeftCol.Position = UDim2.new(0, 0, 0, 26)
SLeftCol.BackgroundTransparency = 1
SLeftCol.ZIndex = 13
SLeftCol.Parent = StealEggTab

local SRightCol = Instance.new("Frame")
SRightCol.Size = UDim2.new(0.49, -2, 1, -28)
SRightCol.Position = UDim2.new(0.51, 0, 0, 26)
SRightCol.BackgroundTransparency = 1
SRightCol.ZIndex = 13
SRightCol.Parent = StealEggTab

createToggle(SLeftCol, "Tự Động Cướp Trứng (Auto Steal)", 0, function(s) _G.AutoStealEgg = s end)
createToggle(SLeftCol, "Cướp Trứng Thiếu Trong Chỉ Mục", 32, function(s) _G.MissingIndex = s end)
createToggle(SLeftCol, "Cướp Từ Người Chơi Khác", 64, function(s) _G.StealFromPlayers = s end)
createToggle(SLeftCol, "Chống Vệ Sĩ (Anti-Guard)", 96, function(s) _G.AntiGuard = s end)
createToggle(SLeftCol, "Thả Trứng Ở Vùng An Toàn", 128, function(s) _G.SafeZoneDrop = s end)
createToggle(SLeftCol, "Bán Trứng Rẻ Nhất Khi Đầy Túi", 160, function(s) _G.AutoSellCheap = s end)

local FilterTitle = Instance.new("TextLabel")
FilterTitle.Size = UDim2.new(1, 0, 0, 22)
FilterTitle.Position = UDim2.new(0, 0, 0, 0)
FilterTitle.BackgroundTransparency = 1
FilterTitle.Text = "🎯 BỘ LỌC & CHỌN KHU VỰC"
FilterTitle.TextColor3 = Color3.fromRGB(255, 180, 100)
FilterTitle.TextSize = 8.5
FilterTitle.Font = Enum.Font.FredokaOne
FilterTitle.TextXAlignment = Enum.TextXAlignment.Left
FilterTitle.ZIndex = 14
FilterTitle.Parent = SRightCol

createToggle(SRightCol, "Ưu Tiên Trứng Giá Trị Cao Nhất", 26, function(s) _G.PriorityHighValue = s end)
createToggle(SRightCol, "Lọc Theo Độ Hiếm Thánh Thần", 58, function(s) _G.FilterGodly = s end)

local DropFrame = Instance.new("Frame")
DropFrame.Size = UDim2.new(1, 0, 0, 38)
DropFrame.Position = UDim2.new(0, 0, 0, 92)
DropFrame.BackgroundColor3 = Color3.fromRGB(35, 14, 25)
DropFrame.ZIndex = 14
DropFrame.Parent = SRightCol
Instance.new("UICorner", DropFrame).CornerRadius = UDim.new(0, 6)

local DropLabel = Instance.new("TextLabel")
DropLabel.Size = UDim2.new(1, -10, 1, 0)
DropLabel.Position = UDim2.new(0, 8, 0, 0)
DropLabel.BackgroundTransparency = 1
DropLabel.Text = "🌐 Khu Vực: Enchanted Forest [+3]"
DropLabel.TextColor3 = Color3.fromRGB(255, 220, 240)
DropLabel.TextSize = 8
DropLabel.Font = Enum.Font.GothamBold
DropLabel.TextXAlignment = Enum.TextXAlignment.Left
DropLabel.ZIndex = 15
DropLabel.Parent = DropFrame

-- TAB 2: HALLOWEEN
local HLeftCol = Instance.new("Frame")
HLeftCol.Size = UDim2.new(0.49, -2, 1, -28)
HLeftCol.Position = UDim2.new(0, 0, 0, 26)
HLeftCol.BackgroundTransparency = 1
HLeftCol.ZIndex = 13
HLeftCol.Parent = HalloweenTab

local HRightCol = Instance.new("Frame")
HRightCol.Size = UDim2.new(0.49, -2, 1, -28)
HRightCol.Position = UDim2.new(0.51, 0, 0, 26)
HRightCol.BackgroundTransparency = 1
HRightCol.ZIndex = 13
HRightCol.Parent = HalloweenTab

createToggle(HLeftCol, "Q Phiên Không Gian Halloween", 0, function(s) _G.SpaceHallow = s end)
createToggle(HLeftCol, "Tự Động Cướp Thùng Halloween", 32, function(s) _G.AutoHallowEggs = s end)
createToggle(HLeftCol, "Cướp Siêu Tốc Thùng Halloween", 64, function(s) _G.SuperFast = s end)
createToggle(HLeftCol, "Tự Động Đánh Boss Bí Ngô", 96, function(s) _G.AutoPumpkinBoss = s end)
createToggle(HLeftCol, "Tự Động Trăng Bí Ngô", 128, function(s) _G.AutoPumpkinMoon = s end)

createToggle(HRightCol, "Tự Động Đánh Quái Vật", 0, function(s
