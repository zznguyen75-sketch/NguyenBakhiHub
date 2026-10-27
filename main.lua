-- Xóa menu cũ nếu đã tồn tại để tránh trùng lặp
if game.CoreGui:FindFirstChild("NguyenBakhiGUI") then
    game.CoreGui.NguyenBakhiGUI:Destroy()
end

-- Tạo ScreenGui chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Khung chính của Menu
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 320)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = " Nguyen Bakhi Hub | Steal An Egg"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Sửa lỗi hiển thị bo tròn góc trên tiêu đề
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0, 10)
TitleFix.Position = UDim2.new(0, 0, 1, -10)
TitleFix.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = Title

-- Khu vực chứa các nút chức năng (ScrollingFrame)
local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -10, 1, -50)
Container.Position = UDim2.new(0, 5, 0, 45)
Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 300)
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Container

-- Biến trạng thái tính năng
local F = {
    Egg = false,
    Mob = false,
}

-- Hàm tạo Button Bật/Tắt nhanh chóng
data = data or {}
local function CreateToggleButton(name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0.95, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Btn.Text = name .. ": TẮT"
    Btn.TextColor3 = Color3.fromRGB(255, 80, 80)
    Btn.TextSize = 14
    Btn.Font = Enum.Font.SourceSansBold
    Btn.Parent = Container
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn
    
    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            Btn.Text = name .. ": BẬT"
            Btn.TextColor3 = Color3.fromRGB(80, 255, 80)
        else
            Btn.Text = name .. ": TẮT"
            Btn.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
        callback(state)
    end)
end

-- 1. Chức năng Nhặt Trứng Nhanh
CreateToggleButton("Nhặt Trứng Nhanh", function(state)
    F.Egg = state
    if F.Egg then
        task.spawn(function()
            while F.Egg do task.wait(0.1)
                pcall(function()
                    for _, o in ipairs(workspace:GetChildren()) do
                        if string.find(string.lower(o.Name), "egg") then
                            local p = o:FindFirstChildOfClass("ProximityPrompt", true)
                            if p and fireproximityprompt then 
                                fireproximityprompt(p) 
                            end
                            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp and o:FindFirstChild("TouchInterest") and firetouchinterest then
                                firetouchinterest(hrp, o, 0) 
                                firetouchinterest(hrp, o, 1)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

-- 2. Chức năng Đóng Băng Quái
CreateToggleButton("Đóng Băng Quái", function(state)
    F.Mob = state
    task.spawn(function()
        while F.Mob do task.wait(0.5)
            pcall(function()
                for _, m in ipairs(workspace:GetChildren()) do
                    if m:FindFirstChild("Humanoid") and m:FindFirstChild("HumanoidRootPart") and not game.Players:GetPlayerFromCharacter(m) then
                        m.HumanoidRootPart.Anchored = true
                        m.Humanoid.WalkSpeed = 0
                    end
                end
            end)
        end
        if not F.Mob then
            pcall(function()
                for _, m in ipairs(workspace:GetChildren()) do
                    if m:FindFirstChild("Humanoid") and m:FindFirstChild("HumanoidRootPart") and not game.Players:GetPlayerFromCharacter(m) then
                        m.HumanoidRootPart.Anchored = false
                        m.Humanoid.WalkSpeed = 16
                    end
                end
            end)
        end
    end)
end)
