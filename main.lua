-- Nguyenbakhi - Steal an Egg (Ultimate Pro GUI v30.0 - Full Features & Halloween Boss/Candy/Ship)
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

local currentLang = "VN"

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
MainStroke.Color = Color3.fromRGB(90, 70, 130)
MainStroke.Thickness = 1.8
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 44)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 220, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Chilli Hub V7 (Nguyenbakhi)"
Title.TextColor3 = Color3.fromRGB(255, 100, 150)
Title.TextSize = 14
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0, 150, 0, 26)
SearchBox.Position = UDim2.new(1, -200, 0.5, -13)
SearchBox.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
SearchBox.PlaceholderText = "🔍 Tìm kiếm..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(240, 240, 255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
SearchBox.TextSize = 11
SearchBox.Font = Enum.Font.Gotham
SearchBox.Parent = TopBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBox

local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 32, 0, 26)
LangBtn.Position = UDim2.new(1, -42, 0.5, -13)
LangBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
LangBtn.Text = "VN"
LangBtn.TextColor3 = Color3.fromRGB(200, 150, 255)
LangBtn.TextSize = 11
LangBtn.Font = Enum.Font.FredokaOne
LangBtn.Parent = TopBar

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 6)
LangCorner.Parent = LangBtn

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 55, 1, -44)
Sidebar.Position = UDim2.new(0, 0, 0, 44)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
Sidebar.BorderSizePixel = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 300)
Sidebar.ScrollBarThickness = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0,
    task.wait(0.6)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("egg") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LocalPlayer.Character.HumanoidRootPart
                        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            local targetPos = v.Position + Vector3.new(0, 3, 0)
                            if (targetPos - hrp.Position).Magnitude < 300 then
                                hrp.CFrame = CFrame.new(targetPos)
                            end
                        end
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

-- TAB 2 (⭐): NGÔI SAO
createDropdown(Tab2, "Steal Egg (Bộ lọc)", "Steal Egg (Filter)", {"Secret", "Extreme", "Divine"}, function(selected) _G.StarStealEggFilter = selected end)

createToggle(Tab2, "Tự động vào máy trên bục", "Auto Machine on Podium", function(state)
    _G.AutoPodiumMachine = state
    task.spawn(function()
        while _G.AutoPodiumMachine do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("podium") or v.Name:lower():find("buc") or v.Name:lower():find("may")) and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if prompt then fireproximityprompt(prompt) else LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0) end
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động Halloween", "Auto Halloween", function(state)
    _G.AutoHalloween = state
    task.spawn(function()
        while _G.AutoHalloween do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("halloween") and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động farm kẹo", "Auto Farm Candy", function(state)
    _G.AutoFarmCandy = state
    task.spawn(function()
        while _G.AutoFarmCandy do
            task.wait(0.3)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("candy") or v.Name:lower():find("keo")) and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động farm tàu", "Auto Farm Ship", function(state)
    _G.AutoFarmShip = state
    task.spawn(function()
        while _G.AutoFarmShip do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("ship") or v.Name:lower():find("boat") or v.Name:lower():find("tau")) and v:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 0, 4)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động farm sự kiện Halloween", "Auto Halloween Event Farm", function(state)
    _G.AutoHalloweenEvent = state
    task.spawn(function()
        while _G.AutoHalloweenEvent do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("event") or v.Name:lower():find("bi ngo") or v.Name:lower():find("halloween")) and v:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
            end)
        end
    end)
end)

createToggle(Tab2, "Tự động đánh boss Halloween", "Auto Halloween Boss", function(state)
    _G.AutoHalloweenBoss = state
    task.spawn(function()
        while _G.AutoHalloweenBoss do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if (v.Name:lower():find("boss") or v.Name:lower():find("halloween boss")) and v:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 0, 5)
                        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                    end
                end
            end)
        end
    end)
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
                if tool and tool.Name:lower():find("fish") then tool:Activate() end
            end)
        
