-- Удаляем старые ESP
for _, h in ipairs(game.CoreGui:GetChildren()) do
    if h:IsA("Highlight") and h.Name == "BeaksESP" then
        h:Destroy()
    end
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local maxDistance = 1000

-- Функция создания Highlight
local function highlightPart(part)
    local highlight = Instance.new("Highlight")
    highlight.Name = "BeaksESP"
    highlight.Adornee = part
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 1
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = game.CoreGui
end

-- Поиск и фильтрация
for _, normal in ipairs(workspace:GetDescendants()) do
    if normal:IsA("Model") and normal.Name == "Normal" then
        local torso = normal:FindFirstChild("Torso")
        if torso and torso:IsA("Model") then
            for _, part in ipairs(torso:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Primary" then
                    local distance = (part.Position - root.Position).Magnitude
                    if distance <= maxDistance then
                        highlightPart(part)
                    end
                end
            end
        end
    end
end
