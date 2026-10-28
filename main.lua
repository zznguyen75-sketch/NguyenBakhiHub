-- Nguyenbakhi - Steal an Egg (Ultimate Pro GUI v34.0 - Full No-Lag Hub & Welcome Dialog & Key Server Notification)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")

if CoreGui:FindFirstChild("NguyenBakhiGUI") then
    CoreGui.NguyenBakhiGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 1. BẢNG CHỌN NGÔN NGỮ BAN ĐẦU (Giống ảnh Screenshot_20261028_152548.jpg)
local LangModal = Instance.new("Frame")
LangModal.Size = UDim2.new(0, 420, 0, 180)
LangModal.Position = UDim2.new(0.5, -210, 0.5, -90)
LangModal.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
LangModal.Parent = ScreenGui
Instance.new("UICorner", LangModal).CornerRadius = UDim.new(0, 12)
local LangStroke = Instance.new("UIStroke")
LangStroke.Color = Color3.fromRGB(255, 100, 180)
LangStroke.Thickness = 1.8
LangStroke.Parent = LangModal

local ModalTitle = Instance.new("TextLabel")
ModalTitle.Size = UDim2.new(1, 0, 0, 40)
ModalTitle.BackgroundTransparency = 1
ModalTitle.Text = "⚡ NO-LAG HUB (120 FPS)"
ModalTitle.TextColor3 = Color3.fromRGB(255, 220, 240)
ModalTitle.TextSize = 14
ModalTitle.Font = Enum.Font.FredokaOne
ModalTitle.Parent = LangModal

local VNBtn = Instance.new("TextButton")
VNBtn.Size = UDim2.new(0, 180, 0, 50)
VNBtn.Position = UDim2.new(0, 20, 0, 70)
VNBtn.BackgroundColor3 = Color3.fromRGB(50, 90, 200)
VNBtn.Text = "🇻🇳 TIẾNG VIỆT"
VNBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VNBtn.TextSize = 13
VNBtn.Font = Enum.Font.FredokaOne
VNBtn.Parent = LangModal
Instance.new("UICorner", VNBtn).CornerRadius = UDim.new(0, 8)

local ENBtn = Instance.new("TextButton")
ENBtn.Size = UDim2.new(0, 180, 0, 50)
ENBtn.Position = UDim2.new(1, -200, 0, 70)
ENBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
ENBtn.Text = "🌐 ENGLISH"
ENBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
ENBtn.TextSize = 13
ENBtn.Font = Enum.Font.FredokaOne
ENBtn.Parent = LangModal
Instance.new("UICorner", ENBtn).CornerRadius = UDim.new(0, 8)


-- 2. BẢNG THÔNG BÁO GỐC DƯỚI PHẢI: "Key Server - Free mode - không cần key" (Giống ảnh 25)
local KeyNotify = Instance.new("Frame")
KeyNotify.Size = UDim2.new(0, 240, 0, 60)
KeyNotify.Position = UDim2.new(1, -250, 1, -70)
KeyNotify.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
KeyNotify.Visible = false
KeyNotify.Parent = ScreenGui
Instance.new("UICorner", KeyNotify).CornerRadius = UDim.new(0, 8)
local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(100, 255, 150)
KeyStroke.Thickness = 1.2
KeyStroke.Parent = KeyNotify

local KeyText = Instance.new("TextLabel")
KeyText.Size = UDim2.new(1, -10, 1, 0)
KeyText.Position = UDim2.new(0, 5, 0, 0)
KeyText.BackgroundTransparency = 1
KeyText.Text = "Key Server\nFree mode - không cần key"
KeyText.TextColor3 = Color3.fromRGB(200, 255, 200)
KeyText.TextSize = 11
KeyText.Font = Enum.Font.GothamSemibold
KeyText.Parent = KeyNotify


-- 3. BẢNG THÔNG BÁO "Ready. Saved settings load..." (Giống ảnh 19)
local ReadyNotify = Instance.new("Frame")
ReadyNotify.Size = UDim2.new(0, 320, 0, 75)
ReadyNotify.Position = UDim2.new(1, -340, 0, 80)
ReadyNotify.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
ReadyNotify.Visible = false
ReadyNotify.Parent = ScreenGui
Instance.new("UICorner", ReadyNotify).CornerRadius = UDim.new(0, 8)

local ReadyTitle = Instance.new("TextLabel")
ReadyTitle.Size = UDim2.new(1, -20, 0, 25)
ReadyTitle.Position = UDim2.new(0, 10, 0, 5)
ReadyTitle.BackgroundTransparency = 1
ReadyTitle.Text = "🦋 No-Lag"
ReadyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ReadyTitle.TextSize = 12
ReadyTitle.Font = Enum.Font.FredokaOne
ReadyTitle.TextXAlignment = Enum.TextXAlignment.Left
ReadyTitle.Parent = ReadyNotify

local ReadyDesc = Instance.new("TextLabel")
ReadyDesc.Size = UDim2.new(1, -20, 0, 20)
ReadyDesc.Position = UDim2.new(0, 10, 0, 28)
ReadyDesc.BackgroundTransparency = 1
ReadyDesc.Text = "Ready. Saved settings load before automation starts."
ReadyDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
ReadyDesc.TextSize = 10
ReadyDesc.Font = Enum.Font.Gotham
ReadyDesc.TextXAlignment = Enum.TextXAlignment.Left
ReadyDesc.Parent = ReadyNotify

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0.8, 0, 0, 3)
ProgressBar.Position = UDim2.new(0.1, 0, 0, 58)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 100, 180)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ReadyNotify
Instance.new("UICorner", ProgressBar).CornerRadius = UDim.new(1, 0)


-- 4. THANH NỔI PHÍA TRÊN (Floating Bar)
local FloatingBar = Instance.new("Frame")
FloatingBar.Size = UDim2.new(0, 260, 0, 32)
FloatingBar.Position = UDim2.new(0.5, -130, 0, 15)
FloatingBar.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
FloatingBar.Visible = false
FloatingBar.Parent = ScreenGui

Instance.new("UICorner", FloatingBar).CornerRadius = UDim.new(1, 0)
local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = Color3.fromRGB(255, 100, 180)
FloatStroke.Thickness = 1.5
FloatStroke.Parent = FloatingBar

local FloatText = Instance.new("TextLabel")
FloatText.Size = UDim2.new(1, 0, 1, 0)
FloatText.BackgroundTransparency = 1
FloatText.Text = "🔴 No-Lag | 120 fps | 246 ms"
FloatText.TextColor3 = Color3.fromRGB(255, 220, 240)
FloatText.TextSize = 12
FloatText.Font = Enum.Font.FredokaOne
FloatText.Parent = FloatingBar


-- 5. MENU CHÍNH (MAIN FRAME)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 680, 0, 440)
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(70, 60, 100)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- Sidebar dọc bên trái
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 60, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local SideLayout = Instance.new("UIListLayout")
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 8)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 12)
SidePadding.Parent = Sidebar

-- Khu vực nội dung bên phải
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -70, 1, -15)
ContentArea.Position = UDim2.new(0, 65, 0, 10)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Tab Home
local HomeTab = Instance.new("ScrollingFrame")
HomeTab.Size = UDim2.new(1, 0, 1, 0)
HomeTab.BackgroundTransparency = 1
HomeTab.BorderSizePixel = 0
HomeTab.CanvasSize = UDim2.new(0, 0, 0, 500)
HomeTab.ScrollBarThickness = 3
HomeTab.Visible = false
HomeTab.Parent = ContentArea

local HomeLayout = Instance.new("UIListLayout")
HomeLayout.SortOrder = Enum.SortOrder.LayoutOrder
HomeLayout.Padding = UDim.new(0, 10)
HomeLayout.Parent = HomeTab

local WelcomeBox = Instance.new("Frame")
WelcomeBox.Size = UDim2.new(1, -10, 0, 90)
WelcomeBox.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
WelcomeBox.Parent = HomeTab
Instance.new("UICorner", WelcomeBox).CornerRadius = UDim.new(0, 8)

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -20, 1, 0)
WelcomeText.Position = UDim2.new(0, 10, 0, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome To No-Lag, @Bfkai\nMethod: Lifetime Key\nExecution Amount: 0\nRemaining Time: Lifetime / Infinite"
WelcomeText.TextColor3 = Color3.fromRGB(220, 220, 240)
WelcomeText.TextSize = 12
WelcomeText.Font = Enum.Font.GothamSemibold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = WelcomeBox

local DevBox = Instance.new("Frame")
DevBox.Size = UDim2.new(1, -10, 0, 80)
DevBox.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
DevBox.Parent = HomeTab
Instance.new("UICorner", DevBox).CornerRadius = UDim.new(0, 8)

local DevText = Instance.new("TextLabel")
DevText.Size = UDim2.new(1, -20, 1, 0)
DevText.Position = UDim2.new(0, 10, 0, 0)
DevText.BackgroundTransparency = 1
DevText.Text = "✨ Đội Ngũ Phát Triển\nBản quyền thuộc Đội ngũ No-Lag:\nCảm ơn bạn đã ủng hộ No-Lag :p\ndiscord.gg/Ndzk9kPZmT"
DevText.TextColor3 = Color3.fromRGB(200, 200, 220)
DevText.TextSize = 12
DevText.Font = Enum.Font.Gotham
DevText.TextXAlignment = Enum.TextXAlignment.Left
DevText.Parent = DevBox

local VerBox = Instance.new("Frame")
VerBox.Size = UDim2.new(1, -10, 0, 50)
VerBox.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
VerBox.Parent = HomeTab
Instance.new("UICorner", VerBox).CornerRadius = UDim.new(0, 8)

local VerText = Instance.new("TextLabel")
VerText.Size = UDim2.new(1, -20, 1, 0)
VerText.Position = UDim2.new(0, 10, 0, 0)
VerText.BackgroundTransparency = 1
VerText.Text = "📌 Phiên Bản: Phiên bản Script: 0038"
VerText.TextColor3 = Color3.fromRGB(255, 150, 200)
VerText.TextSize = 12
VerText.Font = Enum.Font.FredokaOne
VerText.TextXAlignment = Enum.TextXAlignment.Left
VerText.Parent = VerBox


-- Tab 1: Farm (2 cột)
local FarmTab = Instance.new("Frame")
FarmTab.Size = UDim2.new(1, 0, 1, 0)
FarmTab.BackgroundTransparency = 1
FarmTab.Visible = true
FarmTab.Parent = ContentArea

local ColLeft = Instance.new("ScrollingFrame")
ColLeft.Size = UDim2.new(0.48, 0, 1, 0)
ColLeft.Position = UDim2.new(0, 0, 0, 0)
ColLeft.BackgroundTransparency = 1
ColLeft.BorderSizePixel = 0
ColLeft.CanvasSize = UDim2.new(0, 0, 0, 750)
ColLeft.ScrollBarThickness = 3
ColLeft.Parent = FarmTab

local ColLeftLayout = Instance.new("UIListLayout")
ColLeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
ColLeftLayout.Padding = UDim.new(0, 6)
ColLeftLayout.Parent = ColLeft

local ColRight = Instance.new("ScrollingFrame")
ColRight.Size = UDim2.new(0.48, 0, 1, 0)
ColRight.Position = UDim2.new(0.52, 0, 0, 0)
ColRight.BackgroundTransparency = 1
ColRight.BorderSizePixel = 0
ColRight.CanvasSize = UDim2.new(0, 0, 0, 750)
ColRight.ScrollBarThickness = 3
ColRight.Parent = FarmTab

local ColRightLayout = Instance.new("UIListLayout")
ColRightLayout.SortOrder = Enum.SortOrder.LayoutOrder
ColRightLayout.Padding = UDim.new(0, 6)
ColRightLayout.Parent = ColRight


-- Tab 2: Extra (Sự kiện, Boss, v.v.)
local ExtraTab = Instance.new("ScrollingFrame")
ExtraTab.Size = UDim2.new(1, 0, 1, 0)
ExtraTab.BackgroundTransparency = 1
ExtraTab.BorderSizePixel = 0
ExtraTab.CanvasSize = UDim2.new(0, 0, 0, 1100)
ExtraTab.ScrollBarThickness = 4
ExtraTab.Visible = false
ExtraTab.Parent = ContentArea

local ExtraLayout = Instance.new("UIListLayout")
ExtraLayout.SortOrder = Enum.SortOrder.LayoutOrder
ExtraLayout.Padding = UDim.new(0, 6)
ExtraLayout.Parent = ExtraTab


local function createSidebarBtn(iconText, targetTab)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 42, 0, 42)
    Btn.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    Btn.Text = iconText
    Btn.TextColor3 = Color3.fromRGB(240, 240, 255)
    Btn.TextSize = 14
    Btn.Font = Enum.Font.FredokaOne
    Btn.Parent = Sidebar

    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()
        HomeTab.Visible = (targetTab == 0)
        FarmTab.Visible = (targetTab == 1)
        ExtraTab.Visible = (targetTab == 2)
    end)
end

createSidebarBtn("🦋", 0)
createSidebarBtn("🏠", 0)
createSidebarBtn("🏴", 1)
createSidebarBtn("⚙️", 2)
createSidebarBtn("👁️", 2)
createSidebarBtn("✨", 2)


local function createToggle(parentFrame, titleText, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -5, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    Btn.Text = "  " .. titleText
    Btn.TextColor3 = Color3.fromRGB(210, 210, 230)
    Btn.TextSize = 11
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = parentFrame

    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(0, 40, 1, 0)
    Status.Position = UDim2.new(1, -45, 0, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "OFF"
    Status.TextColor3 = Color3.fromRGB(150, 150, 170)
    Status.TextSize = 11
    Status.Font = Enum.Font.FredokaOne
    Status.Parent = Btn

    local active = false
    Btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            Btn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
            Status.Text = "ON"
            Status.TextColor3 = Color3.fromRGB(180, 255, 180)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
            Status.Text = "OFF"
            Status.TextColor3 = Color3.fromRGB(150, 150, 170)
        end
        pcall(function() callback(active) end)
    end)
    return Btn
end

local function createDropdown(parentFrame, titleText, options, callback)
    local Drop = Instance.new("Frame")
    Drop.Size = UDim2.new(1, -5, 0, 48)
    Drop.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    Drop.Parent = parentFrame
    Instance.new("UICorner", Drop).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -10, 0, 20)
    Label.Position = UDim2.new(0, 6, 0, 4)
    Label.BackgroundTransparency = 1
    Label.Text = titleText
    Label.TextColor3 = Color3.fromRGB(180, 180, 200)
    Label.TextSize = 11
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Drop

    local SelBtn = Instance.new("TextButton")
    SelBtn.Size = UDim2.new(1, -12, 0, 20)
    SelBtn.Position = UDim2.new(0, 6, 0, 24)
    SelBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    SelBtn.Text = options[1] or "Chọn..."
    SelBtn.TextColor3 = Color3.fromRGB(255, 150, 220)
    SelBtn.TextSize = 11
    SelBtn.Font = Enum.Font.FredokaOne
    SelBtn.Parent = Drop
    Instance.new("UICorner", SelBtn).CornerRadius = UDim.new(0, 4)

    local idx = 1
    SelBtn.MouseButton1Click:Connect(function()
        idx = idx + 1
        if idx > #options then idx = 1 end
        SelBtn.Text = options[idx]
        pcall(function() callback(options[idx]) end)
    end)
end

-- XỬ LÝ SỰ KIỆN CHỌN NGÔN NGỮ ĐỂ VÀO GIAO DIỆN CHÍNH
local function startHub()
    LangModal.Visible = false
    KeyNotify.Visible = true
    ReadyNotify.Visible = true
    FloatingBar.Visible = true
    MainFrame.Visible = true

    task.spawn(function()
        task.wait(4)
        ReadyNotify.Visible = false
    end)
end

VNBtn.MouseButton1Click:Connect(startHub)
ENBtn.MouseButton1Click:Connect(startHub)


-- CỘT TRÁI FARM TAB (SỬA LỖI NHẬT TRỨNG KHÔNG BỊ ĐỨNG IM)
createToggle(ColLeft, "Tự Động Cày (Auto Farm)", function(state)
    _G.AutoFarm = state
    task.spawn(function()
        while _G.AutoFarm do
            task.wait(0.25)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        hrp.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                        firetouchinterest(hrp, v, 0)
                        firetouchinterest(hrp, v, 1)
                        break
                    end
                end
            end)
        end
    end)
end)

createToggle(ColLeft, "Tự Cướp Trứng Đã Chọn", function(state)
    _G.AutoSelectedEggs = state
    task.spawn(function()
        while _G.AutoSelectedEggs do
            task.wait(0.25)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        hrp.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                        firetouchinterest(hrp, v, 0)
                        firetouchinterest(hrp, v, 1)
                    end
                end
            end)
        end
    end)
end)

createToggle(ColLeft, "Tự Cướp Tất Cả Trứng", function(state)
    _G.AutoAllEggs = state
    task.spawn(function()
        while _G.AutoAllEggs do
            task.wait(0.2)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        firetouchinterest(hrp, v, 0)
                        firetouchinterest(hrp, v, 1)
                    end
                end
            end)
        end
    end)
end)

createDropdown(ColLeft, "Target Priority", {"Độ Hiếm Cao Nhất", "Giá Trị Cao Nhất", "Gần Nhất", "Secret", "Extreme"}, function(val) _G.Priority = val end)
createDropdown(ColLeft, "Chế Độ Di Chuyển", {"Mặc Định (Original)", "Instant", "Smooth Tween"}, function(val) _G.MoveMode = val end)

-- CỘT PHẢI FARM TAB (BỘ LỌC CƯỚP)
local FilterTitle = Instance.new("TextLabel")
FilterTitle.Size = UDim2.new(1, -5, 0, 26)
FilterTitle.BackgroundTransparency = 1
FilterTitle.Text = "📌 Bộ Lọc Cướp (Filter)"
FilterTitle.TextColor3 = Color3.fromRGB(255, 150, 200)
FilterTitle.TextSize = 12
FilterTitle.Font = Enum.Font.FredokaOne
FilterTitle.TextXAlignment = Enum.TextXAlignment.Left
FilterTitle.Parent = ColRight

local IncomeBox = Instance.new("Frame")
IncomeBox.Size = UDim2.new(1, -5, 0, 48)
IncomeBox.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
IncomeBox.Parent = ColRight
Instance.new("UICorner", IncomeBox).CornerRadius = UDim.new(0, 6)

local IncomeLabel = Instance.new("TextLabel")
IncomeLabel.Size = UDim2.new(1, -10, 0, 20)
IncomeLabel.Position = UDim2.new(0, 6, 0, 4)
IncomeLabel.BackgroundTransparency = 1
IncomeLabel.Text = "Thu Nhập Tối Thiểu / Giây"
IncomeLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
IncomeLabel.TextSize = 11
IncomeLabel.Font = Enum.Font.GothamSemibold
IncomeLabel.TextXAlignment = Enum.TextXAlignment.Left
IncomeLabel.Parent = IncomeBox

local IncomeInput = Instance.new("TextBox")
IncomeInput.Size = UDim2.new(1, -12, 0, 20)
IncomeInput.Position = UDim2.new(0, 6, 0, 24)
IncomeInput.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
IncomeInput.Text = "0"
IncomeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
IncomeInput.TextSize = 11
IncomeInput.Font = Enum.Font.FredokaOne
IncomeInput.Parent = IncomeBox
Instance.new("UICorner", IncomeInput).CornerRadius = UDim.new(0, 4)

createDropdown(ColRight, "Độ Hiếm Tối Thiểu", {"Chọn...", "Thánh Thần", "Huyền Thoại", "Sử Thi"}, function(val) _G.MinRarity = val end)
createDropdown(ColRight, "Độ Hiếm Chính Xác", {"Chọn...", "Secret", "Extreme", "Divine"}, function(val) _G.ExactRarity = val end)

-- TAB 2 (⚙️ / EXTRA): TẤT CẢ TÍNH NĂNG NÂNG CAO (HALLOWEEN, KẺO, TÀU, BỌC MÁY, V.V.)
createToggle(ExtraTab, "Tự Động Vào Máy Trên Bục", function(state)
    _G.AutoPodium = state
    task.spawn(function()
        while _G.AutoPodium do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("podium") or v.Name:lower():find("buc") or v.Name:lower():find("may")) and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
  
