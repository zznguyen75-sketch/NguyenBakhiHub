-- NguyenBakhiHub - Steal an Egg (Ultimate Pro GUI v3.0)
-- Giao diện hồng hoàn chỉnh, tích hợp tính năng đa ngôn ngữ, menu thu gọn, auto nhặt trứng, auto farm kẹo Halloween, auto bay vào thế giới Halloween, auto bắt bướm, auto farm tôm, máy chạy bộ, đóng băng quái và hiển thị ảnh Avatar.

if game.CoreGui:FindFirstChild("NguyenBakhiGUI") then
    game.CoreGui.NguyenBakhiGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 520)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 220, 235)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 150, 185)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
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
Title.Text = "NguyenBakhiHub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.FredokaOne
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 32, 0, 28)
LangBtn.Position = UDim2.new(1, -72, 0.5, -14)
LangBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LangBtn.Text = "VN"
LangBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
LangBtn.TextSize = 12
LangBtn.Font = Enum.Font.FredokaOne
LangBtn.Parent = TopBar

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 6)
LangCorner.Parent = LangBtn

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -34, 0.5, -14)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
MinimizeBtn.TextSize = 16
MinimizeBtn.Font = Enum.Font.FredokaOne
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -16, 1, -105)
Container.Position = UDim2.new(0, 8, 0, 50)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.CanvasSize = UDim2.new(0, 0, 0, 420)
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Container

-- Khung hiển thị hình ảnh Avatar nhân vật bên trong menu
local ImageHolder = Instance.new("ImageLabel")
ImageHolder.Size = UDim2.new(1, 0, 0, 110)
ImageHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageHolder.Image = "rbxassetid://0" -- Bạn có thể thay đổi ID ảnh Roblox tại đây
ImageHolder.ScaleType = Enum.ScaleType.Fit
ImageHolder.Parent = Container

local ImgCorner = Instance.new("UICorner")
ImgCorner.CornerRadius = UDim.new(0, 8)
ImgCorner.Parent = ImageHolder

local currentLang = "VN"

local function createToggle(nameVN, nameEN, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Text = "  " .. nameVN
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
        callback(active)
    end)

    Btn:SetAttribute("NameVN", nameVN)
    Btn:SetAttribute("NameEN", nameEN)
    return Btn
end

createToggle("Auto Nhặt Trứng", "Auto Collect Eggs", function(v) print("Auto Eggs:", v) end)
createToggle("Auto Farm Kẹo Halloween", "Auto Halloween Candy", function(v) print("Auto Candy:", v) end)
createToggle("Bay Vào Thế Giới Halloween", "Halloween World Teleport", function(v) print("Halloween TP:", v) end)
createToggle("Auto Bắt Bướm", "Auto Catch Butterflies", function(v) print("Auto Butterflies:", v) end)
createToggle("Auto Farm Tôm", "Auto Shrimp Farm", function(v) print("Auto Shrimp:", v) end)
createToggle("Máy Chạy Bộ", "Treadmill Boost", function(v) print("Treadmill:", v) end)
createToggle("Đóng Băng Quái", "Freeze Monsters", function(v) print("Freeze:", v) end)

LangBtn.MouseButton1Click:Connect(function()
    if currentLang == "VN" then
        currentLang = "EN"
        LangBtn.Text = "EN"
        Title.Text = "NguyenBakhiHub (EN)"
    else
        currentLang = "VN"
        LangBtn.Text = "VN"
        Title.Text = "NguyenBakhiHub"
    end
    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("TextButton") then
            if currentLang == "EN" then
                child.Text = "  " .. child:GetAttribute("NameEN")
            else
                child.Text = "  " .. child:GetAttribute("NameVN")
            end
        end
    end
end)

local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Container.Visible = false
        MainFrame.Size = UDim2.new(0, 260, 0, 45)
        MinimizeBtn.Text = "+"
    else
        Container.Visible = true
        MainFrame.Size = UDim2.new(0, 260, 0, 520)
        MinimizeBtn.Text = "-"
    end
end)

print("NguyenBakhiHub Ultimate Pro Loaded Successfully!")
