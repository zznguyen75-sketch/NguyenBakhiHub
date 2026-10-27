-- NguyenBakhiHub - Steal an Egg (Ultimate Pro GUI v6.0 - Full Features & Layout)
-- Giao diện chuẩn chỉnh, sắp xếp các tính năng khoa học giống Hub chuyên nghiệp, nút ẩn/hiện bằng Avatar nhân vật.

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("NguyenBakhiGUI") then
    CoreGui.NguyenBakhiGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Lấy ảnh Avatar nhân vật
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local avatarContent, isReady = Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize)
local finalAvatarUrl = isReady and avatarContent or "rbxassetid://0"

-- Nút mở lại menu khi ẩn (Floating Button chứa hình ảnh Avatar bo tròn)
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 150, 185)
ToggleButton.Image = finalAvatarUrl
ToggleButton.Visible = false
ToggleButton.Parent = ScreenGui

local TB_Corner = Instance.new("UICorner")
TB_Corner.CornerRadius = UDim.new(1, 0)
TB_Corner.Parent = ToggleButton

-- Khung chính GUI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 520)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 220, 235)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 150, 185)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

local FixBar = Instance.new("Frame")
FixBar.Size = UDim2.new(1, 0, 0, 10)
FixBar.Position = UDim2.new(0, 0, 1, -10)
FixBar.BackgroundColor3 = Color3.fromRGB(255, 150, 185)
FixBar.BorderSizePixel = 0
FixBar.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NguyenBakhiHub v6.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Nút Ẩn menu
local HideBtn = Instance.new("TextButton")
HideBtn.Size = UDim2.new(0, 28, 0, 28)
HideBtn.Position = UDim2.new(1, -34, 0.5, -14)
HideBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HideBtn.Text = "X"
HideBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
HideBtn.TextSize = 14
HideBtn.Font = Enum.Font.FredokaOne
HideBtn.Parent = TopBar

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 6)
HideCorner.Parent = HideBtn

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -16, 1, -55)
Container.Position = UDim2.new(0, 8, 0, 50)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 750)
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Container

-- Khung hiển thị Avatar lớn bên trong menu
local AvatarHolder = Instance.new("ImageLabel")
AvatarHolder.Size = UDim2.new(1, 0, 0, 130)
AvatarHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AvatarHolder.Image = finalAvatarUrl
AvatarHolder.ScaleType = Enum.ScaleType.Fit
AvatarHolder.Parent = Container

local AvCorner = Instance.new("UICorner")
AvCorner.CornerRadius = UDim.new(0, 10)
AvCorner.Parent = AvatarHolder

-- Hàm tạo tiêu đề danh mục (Section Header) để sắp xếp bài bản
local function createSection(titleText)
    local Sec = Instance.new("TextLabel")
    Sec.Size = UDim2.new(1, 0, 0, 26)
    Sec.BackgroundTransparency = 1
    Sec.Text = "  " .. titleText
    Sec.TextColor3 = Color3.fromRGB(150, 50, 90)
    Sec.TextSize = 13
    Sec.Font = Enum.Font.FredokaOne
    Sec.TextXAlignment = Enum.TextXAlignment.Left
    Sec.Parent = Container
end

-- Hàm tạo các Toggle chức năng độc lập
local function createToggle(name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Text = "  " .. name
    Btn.TextColor3 = Color3.fromRGB(80, 80, 80)
    Btn.TextSize = 13
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = Container

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(0, 60, 1, 0)
    Status.Position = UDim2.new(1, -65, 0, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "OFF"
    Status.TextColor3 = Color3.fromRGB(180, 180, 180)
    Status.TextSize = 12
    Status.Font = Enum.Font.FredokaOne
    Status.Parent = Btn

    local active = false
    Btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            Btn.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Status.Text = "ON"
            Status.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextColor3 = Color3.fromRGB(80, 80, 80)
            Status.Text = "OFF"
            Status.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        pcall(function()
            callback(active)
        end)
    end)
    return Btn
end

-- Sắp xếp các danh mục và tính năng bài bản, khoa học:
createSection("--- TÍNH NĂNG CHÍNH & FARM ---")
createToggle("Auto Nhặt Trứng", function(state) _G.AutoEggs = state end)
createToggle("Auto Farm Kẹo Halloween", function(state) _G.AutoCandy = state end)
createToggle("Bay Vào Thế Giới Halloween", function(state) _G.HalloweenTP = state end)
createToggle("Auto Bắt Bướm", function(state) _G.AutoButterflies = state end)
createToggle("Auto Farm Tôm", function(state) _G.AutoShrimp = state end)

createSection("--- SỰ KIỆN & BOSS ---")
createToggle("Tự Động Cướp Trứng Halloween", function(state) _G.AutoStealHalloweenEggs = state end)
createToggle("Cướp Tức Thì Trứng Halloween", function(state) _G.InstantHalloweenEggs = state end)
createToggle("Tự Động Bí Ngô Boss", function(state) _G.AutoPumpkinBoss = state end)
createToggle("Đóng Băng Quái", function(state) _G.FreezeMobs = state end)

createSection("--- TIỆN ÍCH & TỐC ĐỘ ---")
createToggle("Máy Chạy Bộ (Treadmill Boost)", function(state) _G.Treadmill = state end)
createToggle("Tốc Độ Stubs Pickup", function(state) _G.FastStubs = state end)
createToggle("Chế Độ Chậm (Slow Mode)", function(state) _G.SlowMode = state end)

-- Xử lý ẩn/hiện menu bằng hình ảnh Avatar
HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)

print("NguyenBakhiHub v6.0 Loaded Successfully!")
