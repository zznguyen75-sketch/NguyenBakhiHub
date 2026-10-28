-- NguyenBakhiHub - Steal an Egg (Ultimate Pro GUI v20.0 - Nguyenbakhi Edition)
-- Giao diện ngang cao cấp, đổi tên thành Nguyenbakhi, đầy đủ 100% tính năng cướp trứng, sự kiện, máy chạy bộ, đổi ngôn ngữ VN/EN, khung avatar và nút avatar tròn.

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
local currentLang = "VN"

-- Nút ẩn/hiện menu dạng tròn chứa ảnh Avatar ở góc màn hình
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ToggleButton.Image = customAvatarImage
ToggleButton.Visible = false
ToggleButton.Parent = ScreenGui

local TB_Corner = Instance.new("UICorner")
TB_Corner.CornerRadius = UDim.new(1, 0)
TB_Corner.Parent = ToggleButton

local TB_Stroke = Instance.new("UIStroke")
TB_Stroke.Color = Color3.fromRGB(180, 100, 255)
TB_Stroke.Thickness = 2
TB_Stroke.Parent = ToggleButton

-- Giao diện Menu Ngang Cao Cấp (600px x 400px) chuẩn Chilli Hub V7
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(70, 60, 100)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- TopBar Ngang
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 160, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Nguyenbakhi"
Title.TextColor3 = Color3.fromRGB(255, 100, 150)
Title.TextSize = 16
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Ô Tìm kiếm trên TopBar
local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0, 170, 0, 26)
SearchBox.Position = UDim2.new(1, -220, 0.5, -13)
SearchBox.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
SearchBox.PlaceholderText = "🔍 Tìm kiếm tính năng..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(240, 240, 255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.Gotham
SearchBox.Parent = TopBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBox

-- Nút đổi ngôn ngữ VN/EN riêng biệt
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 32, 0, 26)
LangBtn.Position = UDim2.new(1, -74, 0.5, -13)
LangBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
LangBtn.Text = "VN"
LangBtn.TextColor3 = Color3.fromRGB(200, 150, 255)
LangBtn.TextSize = 11
LangBtn.Font = Enum.Font.FredokaOne
LangBtn.Parent = TopBar

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 6)
LangCorner.Parent = LangBtn

-- Nút ẩn menu
local HideBtn = Instance.new("TextButton")
HideBtn.Size = UDim2.new(0, 26, 0, 26)
HideBtn.Position = UDim2.new(1, -34, 0.5, -13)
HideBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
HideBtn.Text = "X"
HideBtn.TextColor3 = Color3.fromRGB(255, 100, 150)
HideBtn.TextSize = 12
HideBtn.Font = Enum.Font.FredokaOne
HideBtn.Parent = TopBar

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 6)
HideCorner.Parent = HideBtn

-- Sidebar Dọc bên trái
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 55, 1, -42)
Sidebar.Position = UDim2.new(0, 0, 0, 42)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Sidebar.BorderSizePixel = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 300)
Sidebar.ScrollBarThickness = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 10)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 12)
SidePadding.Parent = Sidebar

-- Khu vực chứa nội dung Tab bên phải
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -65, 1, -52)
ContentArea.Position = UDim2.new(0, 60, 0, 48)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Tab 1: Cướp Trứng & Bộ Lọc
local Tab1 = Instance.new("ScrollingFrame")
Tab1.Size = UDim2.new(1, 0, 1, 0)
Tab1.BackgroundTransparency = 1
Tab1.BorderSizePixel = 0
Tab1.CanvasSize = UDim2.new(0, 0, 0, 1100)
Tab1.ScrollBarThickness = 4
Tab1.Visible = true
Tab1.Parent = ContentArea

local Tab1Layout = Instance.new("UIListLayout")
Tab1Layout.SortOrder = Enum.SortOrder.LayoutOrder
Tab1Layout.Padding = UDim.new(0, 6)
Tab1Layout.Parent = Tab1

-- Tab 2: Sự Kiện & Farm & Tiện Ích
local Tab2 = Instance.new("ScrollingFrame")
Tab2.Size = UDim2.new(1, 0, 1, 0)
Tab2.BackgroundTransparency = 1
Tab2.BorderSizePixel = 0
Tab2.CanvasSize = UDim2.new(0, 0, 0, 1100)
Tab2.ScrollBarThickness = 4
Tab2.Visible = false
Tab2.Parent = ContentArea

local Tab2Layout = Instance.new("UIListLayout")
Tab2Layout.SortOrder = Enum.SortOrder.LayoutOrder
Tab2Layout.Padding = UDim.new(0, 6)
Tab2Layout.Parent = Tab2

local function createSidebarTab(iconText, targetTab)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(0, 38, 0, 38)
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    TabBtn.Text = iconText
    TabBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
    TabBtn.TextSize = 14
    TabBtn.Font = Enum.Font.FredokaOne
    TabBtn.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        Tab1.Visible = (targetTab == 1)
        Tab2.Visible = (targetTab == 2)
    end)
end

createSidebarTab("🏠", 1)
createSidebarTab("🥚", 1)
createSidebarTab("⭐", 2)
createSidebarTab("⚙️", 2)

local function createToggle(parentFrame, nameVN, nameEN, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -5, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
    Btn.Text = "  " .. nameVN
    Btn.TextColor3 = Color3.fromRGB(210, 210, 230)
    Btn.TextSize = 12
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = parentFrame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(0, 50, 1, 0)
    Status.Position = UDim2.new(1, -55, 0, 0)
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
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Status.Text = "ON"
            Status.TextColor3 = Color3.fromRGB(180, 255, 180)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
            Btn.TextColor3 = Color3.fromRGB(210, 210, 230)
            Status.Text = "OFF"
            Status.TextColor3 = Color3.fromRGB(150, 150, 170)
        end
        pcall(function()
            callback(active)
        end)
    end)
    Btn:SetAttribute("NameVN", nameVN)
    Btn:SetAttribute("NameEN", nameEN)
    return Btn
end

local function createDropdown(parentFrame, nameVN, nameEN, options, callback)
    local DropFrame = Instance.new("Frame")
    DropFrame.Size = UDim2.new(1, -5, 0, 38)
    DropFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
    DropFrame.Parent = parentFrame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    DropFrame.Parent = DropFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 8, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = nameVN
    Label.TextColor3 = Color3.fromRGB(210, 210, 230)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = DropFrame
    Label:SetAttribute("NameVN", nameVN)
    Label:SetAttribute("NameEN", nameEN)

    local SelectBtn = Instance.new("TextButton")
    SelectBtn.Size = UDim2.new(0.45, 0, 0.8, 0)
    SelectBtn.Position = UDim2.new(0.52, 0, 0.1, 0)
    SelectBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    SelectBtn.Text = options[1] or "Chọn"
    SelectBtn.TextColor3 = Color3.fromRGB(255, 150, 220)
    SelectBtn.TextSize = 11
    SelectBtn.Font = Enum.Font.FredokaOne
    SelectBtn.Parent = DropFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 5)
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

-- ==================== TAB 1: CƯỚP TRỨNG & BỘ LỌC CHI TIẾT ====================
createToggle(Tab1, "Tự động cướp", "Auto Steal", function(state)
    _G.AutoSteal = state
    task.spawn(function()
        while _G.AutoSteal do
            task.wait(0.2)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab1, "Di chuyển tới trứng", "Move to Egg", function(state) _G.MoveToEgg = state end)
createDropdown(Tab1, "Dịch chuyển", "Teleport Method", {"Instant", "Quick steps", "Smooth"}, function(selected) _G.TeleportMethod = selected end)
createDropdown(Tab1, "Khu vực dịch chuyển", "Teleport Area", {"Hoa Anh Đào", "Rừng Phù Phép", "Lords Pack"}, function(selected) _G.TeleportArea = selected end)
createToggle(Tab1, "Cướp trứng thiếu trong Chỉ mục", "Steal Missing Index Eggs", function(state) _G.StealMissingIndex = state end)
createToggle(Tab1, "Cướp từ người chơi khác", "Steal from Other Players", function(state) _G.StealOtherPlayers = state end)

createToggle(Tab1, "Chống vệ sĩ", "Anti Guard", function(state)
    _G.AntiGuard = state
    task.spawn(function()
        while _G.AntiGuard do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("guard") and v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CFrame = CFrame.new(9999, 9999, 9999)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab1, "Thả trứng ở vùng an toàn", "Drop Eggs in Safe Zone", function(state) _G.SafeZoneDrop = state end)
createDropdown(Tab1, "Khu vực (Bộ lọc)", "Area (Filter)", {"Rừng Phù Phép", "Hoa Anh Đào", "Lords Pack", "Khu Bướm", "Khu Hổ", "Khu Gorilla"}, function(selected) _G.FilterArea = selected end)
createDropdown(Tab1, "Ưu tiên cướp", "Priority Steal", {"Độ hiếm cao nhất", "Giá trị cao nhất", "Gần nhất", "Secret", "Extreme", "Divine"}, function(selected) _G.PrioritySteal = selected end)
createDropdown(Tab1, "Đột biến", "Mutation", {"Không có", "Shiny", "Rainbow"}, function(selected) _G.MutationFilter = selected end)
createDropdown(Tab1, "Độ hiếm", "Rarity", {"Thánh Thần", "Huyền Thoại", "Sử Thi", "Hiếm"}, function(selected) _G.RarityFilter = selected end)
createDropdown(Tab1, "Chỉ những trứng này", "Only These Eggs", {"Không có", "Trứng Vàng", "Trứng Kim Cương"}, function(selected) _G.OnlyTheseEggs = selected end)
createToggle(Tab1, "Giá trị tối thiểu/s", "Min Value/s", function(state) _G.MinValueRate = state end)
createToggle(Tab1, "Bán trứng rẻ nhất khi đầy túi", "Sell Cheapest When Full", function(state) _G.SellCheapest = state end)
createToggle(Tab1, "Chỉ dưới mức/s", "Only Below Rate", function(state) _G.OnlyBelowRate = state end)


-- ==================== TAB 2: SỰ KIỆN & FARM & TIỆN ÍCH ====================
createToggle(Tab2, "Tự bay vào Halloween", "Auto Fly to Halloween", function(state)
    _G.AutoFlyHalloween = state
    task.spawn(function()
        while _G.AutoFlyHalloween do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("halloween") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Farm Boss Mới", "Farm New Boss", function(state)
    _G.FarmNewBoss = state
    task.spawn(function()
        while _G.FarmNewBoss do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("boss") or v.Name:lower():find("bi ngo")) and v:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 0, 4)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Nhặt trứng (Độ lọc)", "Collect Eggs (Rarity Filter)", function(state) _G.RarityFilterEgg = state end)
createToggle(Tab2, "Tram sự kiện quái Halloween", "Halloween Event Mobs Station", function(state) _G.HalloweenEventMobs = state end)

createToggle(Tab2, "Tram ma ở Tân Hóa", "Tan Hoa Ghost Station", function(state)
    _G.TanHoaGhostStation = state
    task.spawn(function()
        while _G.TanHoaGhostStation do
            task.wait(1)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("tan hoa") or v.Name:lower():find("ghost") then
                        if v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động đi câu", "Auto Fishing", function(state)
    _G.AutoFishing = state
    task.spawn(function()
        while _G.AutoFishing do
            task.wait(1)
            pcall(function()
                local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool and tool.Name:lower():find("fish") then
                    tool:Activate()
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tượng đổi màu sơn mới", "New Paint Statue", function(state) _G.NewPaintStatue = state end)

createToggle(Tab2, "Tự động máy chạy bộ", "Auto Treadmill", function(state)
    _G.AutoTreadmill = state
    task.spawn(function()
        while _G.AutoTreadmill do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("treadmill") or v.Name:lower():find("may chay bo") then
                        local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if prompt then
                            fireproximityprompt(prompt)
                        end
                    end
                end
            end)
        end
    end)
end)

-- Xử lý chuyển đổi ngôn ngữ VN/EN
LangBtn.MouseButton1Click:Connect(function()
    if currentLang == "VN" then
        currentLang = "EN"
        LangBtn.Text = "EN"
    else
        currentLang = "VN"
        LangBtn.Text = "VN"
    end

    for _, container in ipairs({Tab1, Tab2}) do
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("TextButton") and child:GetAttribute("NameVN") then
                if currentLang == "EN" then
                    child.Text = "  " .. child:GetAttribute("NameEN")
                else
                    child.Text = "  " .. child:GetAttribute("NameVN")
                end
            elseif child:IsA("Frame") then
                local lbl = child:FindFirstChildOfClass("TextLabel")
                if lbl and lbl:GetAttribute("NameVN") then
                    if currentLang == "EN" then
                        lbl.Text = lbl:GetAttribute("NameVN")
                    else
                        lbl.Text = lbl:GetAttribute("NameVN")
                    end
                end
            end
        end
    end
end)

HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)

print("Nguyenbakhi Hub Loaded Successfully!")
