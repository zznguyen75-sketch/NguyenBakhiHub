-- NguyenBakhiHub - Steal an Egg (Ultimate Pro GUI v8.0 - Full Features & Filters)
-- Bổ sung đầy đủ bộ lọc (Dropdown), tính năng hoàn chỉnh, giao diện hồng, khung avatar và nút ẩn/hiện avatar bo tròn.

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

local customAvatarImage = "rbxassetid://0" -- Ảnh đại diện cố định

-- Nút ẩn/hiện menu dạng tròn chứa ảnh Avatar
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 150, 185)
ToggleButton.Image = customAvatarImage
ToggleButton.Visible = false
ToggleButton.Parent = ScreenGui

local TB_Corner = Instance.new("UICorner")
TB_Corner.CornerRadius = UDim.new(1, 0)
TB_Corner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 310, 0, 540)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -270)
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
Title.Text = "NguyenBakhiHub v8.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

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
Container.CanvasSize = UDim2.new(0, 0, 0, 950)
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Container

-- Khung Avatar nhân vật lớn ở đầu menu
local AvatarHolder = Instance.new("ImageLabel")
AvatarHolder.Size = UDim2.new(1, 0, 0, 130)
AvatarHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AvatarHolder.Image = customAvatarImage
AvatarHolder.ScaleType = Enum.ScaleType.Fit
AvatarHolder.Parent = Container

local AvCorner = Instance.new("UICorner")
AvCorner.CornerRadius = UDim.new(0, 10)
AvCorner.Parent = AvatarHolder

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

-- Hàm tạo bộ lọc (Dropdown Selector)
local function createDropdown(name, options, callback)
    local DropFrame = Instance.new("Frame")
    DropFrame.Size = UDim2.new(1, 0, 0, 40)
    DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropFrame.Parent = Container

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = DropFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(80, 80, 80)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = DropFrame

    local SelectBtn = Instance.new("TextButton")
    SelectBtn.Size = UDim2.new(0.45, 0, 0.8, 0)
    SelectBtn.Position = UDim2.new(0.52, 0, 0.1, 0)
    SelectBtn.BackgroundColor3 = Color3.fromRGB(255, 220, 235)
    SelectBtn.Text = options[1] or "Chọn"
    SelectBtn.TextColor3 = Color3.fromRGB(150, 50, 90)
    SelectBtn.TextSize = 12
    SelectBtn.Font = Enum.Font.FredokaOne
    SelectBtn.Parent = DropFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = SelectBtn

    local currentIndex = 1
    SelectBtn.MouseButton1Click:Connect(function()
        currentIndex = currentIndex + 1
        if currentIndex > #options then
            currentIndex = 1
        end
        local selected = options[currentIndex]
        SelectBtn.Text = selected
        pcall(function()
            callback(selected)
        end)
    end)
end

-- Sắp xếp toàn bộ tính năng và bộ lọc
createSection("--- TÍNH NĂNG CHÍNH & FARM ---")
createToggle("Auto Nhặt Trứng", function(state) _G.AutoEggs = state end)
createToggle("Auto Farm Kẹo Halloween", function(state) _G.AutoCandy = state end)
createToggle("Bay Vào Thế Giới Halloween", function(state) _G.HalloweenTP = state end)
createToggle("Auto Bắt Bướm", function(state) _G.AutoButterflies = state end)
createToggle("Auto Farm Tôm", function(state) _G.AutoShrimp = state end)

createSection("--- SỰ KIỆN & BOSS & BỘ LỌC ---")
createToggle("Tự Động Cướp Trứng Halloween", function(state) _G.AutoStealHalloween = state end)
createToggle("Cướp Tức Thì Trứng Halloween", function(state) _G.InstantHalloween = state end)
createDropdown("Trứng Halloween", {"Không có", "Trứng Thường", "Trứng Vàng", "Trứng Kim Cương"}, function(selected)
    _G.SelectedHalloweenEgg = selected
end)
createDropdown("Độ Hiếm Halloween", {"Thánh Thần", "Huyền Thoại", "Sử Thi", "Hiếm"}, function(selected)
    _G.SelectedRarity = selected
end)

createToggle("Tự Động Bí Ngô Boss", function(state) _G.AutoBoss = state end)
createToggle("Tự Động Dodge Attacks", function(state) _G.AutoDodge = state end)
createToggle("Sử Dụng Vũ Khí", function(state) _G.UseWeapon = state end)
createDropdown("Chọn Vũ Khí", {"Enchanted Hammer", "Magic Wand", "Shadow Blade"}, function(selected)
    _G.SelectedWeapon = selected
end)

createToggle("Đóng Băng Quái", function(state) _G.FreezeMobs = state end)

createSection("--- TIỆN ÍCH & TỐC ĐỘ ---")
createToggle("Máy Chạy Bộ (Treadmill Boost)", function(state) _G.Treadmill = state end)
createToggle("Tự Động Nhận Mastery", function(state) _G.AutoMastery = state end)
createDropdown("Tốc Độ Stubs Pickup", {"300 st/s", "500 st/s", "1000 st/s", "Max Speed"}, function(selected)
    _G.StubsSpeed = selected
end)
createToggle("Tự Động Manor Key", function(state) _G.AutoManorKey = state end)

HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)

print("NguyenBakhiHub v8.0 Loaded Successfully!")
