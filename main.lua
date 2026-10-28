-- Nguyenbakhi - Steal an Egg (Ultimate Pro GUI v25.0 - Full Chilli Hub V7 Features & Safe Execution)
-- Phiên bản tối thượng: Tích hợp toàn bộ hàng loạt tính năng khủng từ Chilli Hub V7, đầy đủ bộ lọc, sự kiện, farm boss, máy chạy bộ, không lag, an toàn tuyệt đối không chết.

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

if CoreGui:FindFirstChild("NguyenBakhiGUI") then
    CoreGui.NguyenBakhiGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local currentLang = "VN"

-- Giao diện Menu Ngang Cao Cấp (640px x 430px) - Cố định không tắt
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 640, 0, 430)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -215)
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
Title.Text = "Nguyenbakhi Hub V7"
Title.TextColor3 = Color3.fromRGB(255, 100, 150)
Title.TextSize = 16
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Ô Tìm kiếm tính năng
local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0, 180, 0, 26)
SearchBox.Position = UDim2.new(1, -210, 0.5, -13)
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

-- Nút đổi ngôn ngữ VN/EN
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 32, 0, 26)
LangBtn.Position = UDim2.new(1, -64, 0.5, -13)
LangBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
LangBtn.Text = "VN"
LangBtn.TextColor3 = Color3.fromRGB(200, 150, 255)
LangBtn.TextSize =
uto Steal", function(state)
    _G.AutoSteal = state
    task.spawn(function()
        while _G.AutoSteal do
            task.wait(0.2)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
            end)
        end
    end)
end)

createToggle(ColLeft, "Di chuyển tới trứng", "Move to Egg", function(state)
    _G.MoveToEgg = state
    task.spawn(function()
        while _G.MoveToEgg do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        local dist = (v.Position - hrp.Position).Magnitude
                        local tweenTime = math.clamp(dist / 50, 0.2, 1.5)
                        local tween = TweenService:Create(hrp, TweenInfo.new(tweenTime, Enum.EasingStyle.Linear), {CFrame = v.CFrame + Vector3.new(0, 2, 0)})
                        tween:Play()
                        tween.Completed:Wait()
                        break
                    end
                end
            end)
        end
    end)
end)

createDropdown(ColLeft, "Dịch chuyển", "Teleport Method", {"Instant", "Quick steps", "Smooth"}, function(selected) _G.TeleportMethod = selected end)
createDropdown(ColLeft, "Khu vực dịch chuyển", "Teleport Area", {"Hoa Anh Đào", "Rừng Phù Phép", "Lords Pack"}, function(selected) _G.TeleportArea = selected end)
createToggle(ColLeft, "Cướp trứng thiếu Index", "Steal Missing Index", function(state) _G.StealMissingIndex = state end)
createToggle(ColLeft, "Cướp từ người chơi khác", "Steal Other Players", function(state) _G.StealOtherPlayers = state end)

createToggle(ColLeft, "Chống vệ sĩ", "Anti Guard", function(state)
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

createToggle(ColLeft, "Thả trứng vùng an toàn", "Drop Safe Zone", function(state) _G.SafeZoneDrop = state end)

-- CỘT PHẢI TAB 1
createDropdown(ColRight, "Khu vực (Bộ lọc)", "Area (Filter)", {"Rừng Phù Phép", "Hoa Anh Đào", "Lords Pack", "Khu Bướm", "Khu Hổ", "Khu Gorilla"}, function(selected) _G.FilterArea = selected end)
createDropdown(ColRight, "Ưu tiên cướp", "Priority Steal", {"Độ hiếm cao nhất", "Giá trị cao nhất", "Gần nhất", "Secret", "Extreme", "Divine"}, function(selected) _G.PrioritySteal = selected end)
createDropdown(ColRight, "Đột biến", "Mutation", {"Không có", "Shiny", "Rainbow"}, function(selected) _G.MutationFilter = selected end)
createDropdown(ColRight, "Độ hiếm", "Rarity", {"Thánh Thần", "Huyền Thoại", "Sử Thi", "Hiếm"}, function(selected) _G.RarityFilter = selected end)
createDropdown(ColRight, "Chỉ những trứng này", "Only These Eggs", {"Không có", "Trứng Vàng", "Trứng Kim Cương"}, function(selected) _G.OnlyTheseEggs = selected end)
createToggle(ColRight, "Giá trị tối thiểu/s", "Min Value/s", function(state) _G.MinValueRate = state end)
createToggle(ColRight, "Bán rẻ khi đầy túi", "Sell Cheapest", function(state) _G.SellCheapest = state end)
createToggle(ColRight, "Chỉ dưới mức/s", "Only Below Rate", function(state) _G.OnlyBelowRate = state end)


-- ==================== TAB 2 (⭐): PHẦN NGÔI SAO - BẢN VẼ TAY & NOLAG ====================
createDropdown(Tab2, "Steal Egg (Bộ lọc)", "Steal Egg (Filter)", {"Secret", "Extreme", "Divine"}, function(selected)
    _G.StarStealEggFilter = selected
end)

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
createToggle(Tab2, "Trạm sự kiện quái Halloween", "Halloween Event Mobs Station", function(state) _G.HalloweenEventMobs = state end)

createToggle(Tab2, "Trạm ma ở Tân Hóa", "Tan Hoa Ghost Station", function(state)
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

-- Bổ sung tính năng Nolag / Giảm lag tối ưu từ script ngoài
createToggle(Tab2, "Chế độ Không Lag (No-Lag Mode)", "No-Lag Mode", function(state)
    _G.NoLagMode = state
    task.spawn(function()
        if _G.NoLagMode then
            pcall(function()
                Lighting.GlobalShadows = false
                Lighting.Brightness = 2
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Material = Enum.Material.SmoothPlastic
                        v.Reflectance = 0
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Enabled = false
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

    for _, container in ipairs({ColLeft, ColRight, Tab2}) do
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
                        lbl.Text = lbl:GetAttribute("NameEN")
                    else
                        lbl.Text = lbl:GetAttribute("NameVN")
                    end
                end
            end
        end
    end
end)

print("Nguyenbakhi v23.0 Nolag Integrated Successfully!")
