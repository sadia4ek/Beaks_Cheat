local function highlightPart(part)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = part
    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Красный
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 1
    highlight.Parent = part
end

-- Поиск всех моделей "Normal" и партов "Primary"
for _, normal in ipairs(workspace:GetDescendants()) do
    if normal:IsA("Model") and normal.Name == "Normal" then
        local torso = normal:FindFirstChild("Torso")
        if torso and torso:IsA("Model") then
            for _, part in ipairs(torso:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Primary" then
                    highlightPart(part)
                end
            end
        end
    end
end
