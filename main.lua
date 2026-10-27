-- NguyenBakhiHub - Steal an Egg (Final Pink Pro Edition)
if game.CoreGui:FindFirstChild("NguyenBakhiGUI") then
    game.CoreGui.NguyenBakhiGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NguyenBakhiGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 470)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -235)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 105, 180)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.Text = "💖 Nguyen Bakhi Hub 💖"
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- Ngôn ngữ
local isVietnamese = true

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 40, 0, 24)
langBtn.Position = UDim2.new(1, -45, 0, 8)
langBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 150)
langBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
langBtn.TextSize = 11
langBtn.Font = Enum.Font.GothamBold
langBtn.Text = "VN"
langBtn.Parent = Title

local langCorner = Instance.new("UICorner")
langCorner.CornerRadius = UDim.new(0, 6)
langCorner.Parent = langBtn

local buttonList = {}

local function createButton(textVN, textEN, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 220, 0, 35)
    btn.Position = UDim2.new(0.5, -110, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 35, 45)
    btn.TextColor3 = Color3.fromRGB(255, 220, 240)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = isVietnamese and textVN or textEN
    btn.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 150, 200)
    stroke.Transparency = 0.5
    stroke.Parent = btn

    table.insert(buttonList, {Button = btn, VN = textVN, EN = textEN})

    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            btn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            btn.BackgroundColor3 = Color3.fromRGB(50, 35, 45)
            btn.TextColor3 = Color3.fromRGB(255, 220, 240)
        end
        callback(active)
    end)
    return btn
end

local autoWalkEggActive = false
local autoHalloweenActive = false
local autoButterflyActive = false
local freezeMonsterActive = false
local autoTreadmillActive = false

-- 1. Nhặt trứng
createButton("Tự Di Chuyển & Nhặt Trứng", "Auto Walk & Collect Egg", 50, function(state)
    autoWalkEggActive = state
    task.spawn(function()
        local player = game.Players.LocalPlayer
        while autoWalkEggActive do
            task.wait(0.3)
            pcall(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if not autoWalkEggActive then break end
                        if v:IsA("ProximityPrompt") and string.find(string.lower(v.Parent.Name), "egg") then
                            local targetPart = v.Parent
                            if targetPart:IsA("BasePart") then
                                char.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2)
                                fireproximityprompt(v)
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- 2. Halloween
createButton("🎃 Auto Farm Halloween (Kẹo)", "🎃 Auto Farm Halloween (Candy)", 90, function(state)
    autoHalloweenActive = state
    task.spawn(function()
        local player = game.Players.LocalPlayer
        while autoHalloweenActive do
            task.wait(0.3)
            pcall(function()
                local char = player.Character
                for _, v in pairs(workspace:GetDescendants()) do
                    if not autoHalloweenActive then break end
                    if v:IsA("ProximityPrompt") and (string.find(string.lower(v.Parent.Name), "halloween") or string.find(string.lower(v.Name), "candy")) then
                        local p = v.Parent
                        if p:IsA("BasePart") and char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = p.CFrame + Vector3.new(0, 2, 0)
                            task.wait(0.2)
                            fireproximityprompt(v)
                        end
                    end
                end
            end)
        end
    end)
end)

-- 3. Bắt bướm
createButton("🦋 Tự Động Bắt Bướm", "🦋 Auto Catch Butterfly", 130, function(state)
    autoButterflyActive = state
    task.spawn(function()
        local player = game.Players.LocalPlayer
        while autoButterflyActive do
            task.wait(0.3)
            pcall(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if not autoButterflyActive then break end
                        if string.find(string.lower(v.Name), "butterfly") or (v:IsA("Model") and string.find(string.lower(v.Name), "butterfly")) then
                            local targetPart = v:IsA("Model") and v.PrimaryPart or v
                            if not targetPart and v:IsA("Model") then
                                targetPart = v:FindFirstChildWhichIsA("BasePart")
                            end
                            if targetPart and targetPart:IsA("BasePart") then
                                char.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 2, 0)
                                task.wait(0.2)
                                for _, prompt in pairs(v:GetDescendants()) do
                                    if prompt:IsA("ProximityPrompt") then
                                        fireproximityprompt(prompt)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- 4. Đóng băng quái
createButton("❄️ Đóng Băng Quái", "❄️ Freeze Monsters", 170, function(state)
    freezeMonsterActive = state
    task.spawn(function()
        while freezeMonsterActive do
            task.wait(0.5)
            pcall(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp then hrp.Anchored = true end
                        v.Humanoid.WalkSpeed = 0
                    end
                end
            end)
        end
    end)
end)

-- 5. Máy chạy bộ
createButton("🏃 Auto Vào Máy Chạy Bộ", "🏃 Auto Use Treadmill", 210, function(state)
    autoTreadmillActive = state
    task.spawn(function()
        local player = game.Players.LocalPlayer
        while autoTreadmillActive do
            task.wait(0.5)
            pcall(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if not autoTreadmillActive then break end
                        if v:IsA("BasePart") and (string.find(string.lower(v.Name), "treadmill") or string.find(string.lower(v.Name), "gym")) then
                            char.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.3)
                            for _, prompt in pairs(v:GetDescendants()) do
                                if prompt:IsA("ProximityPrompt") then
                                    fireproximityprompt(prompt)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

langBtn.MouseButton1Click:Connect(function()
    isVietnamese = not isVietnamese
    langBtn.Text = isVietnamese and "VN" or "EN"
    for _, item in ipairs(buttonList) do
        item.Button.Text = isVietnamese and item.VN or item.EN
    end
end)

-- Nút Ẩn / Hiện Menu (Nằm sát dưới các tính năng)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 220, 0, 35)
toggleBtn.Position = UDim2.new(0.5, -110, 0, 260)
toggleBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 150)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 13
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Text = "Ẩn / Hiện Menu"
toggleBtn.Parent = MainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleBtn

local visible = true
toggleBtn.MouseButton1Click:Connect(function()
    visible = not visible
    for _, child in pairs(MainFrame:GetChildren()) do
        if child ~= Title and child ~= toggleBtn and child ~= UICorner then
            child.Visible = visible
        end
    end
    if visible then
        MainFrame.Size = UDim2.new(0, 260, 0, 470)
        toggleBtn.Position = UDim2.new(0.5, -110, 0, 260)
    else
        MainFrame.Size = UDim2.new(0, 260, 0, 40)
        toggleBtn.Position = UDim2.new(0.5, -110, 0, 5)
    end
end)
