local maxDistance = 400
local camera = workspace.CurrentCamera

-- Поиск всех моделей "Normal" в Workspace
local function findAllPrimaryParts()
    local primaryParts = {}

    for _, normal in ipairs(workspace:GetDescendants()) do
        if normal:IsA("Model") and normal.Name == "Normal" then
            local torso = normal:FindFirstChild("Torso")
            if torso and torso:IsA("Model") then
                for _, part in ipairs(torso:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name == "Primary" then
                        table.insert(primaryParts, part)
                    end
                end
            end
        end
    end

    return primaryParts
end

-- Найдём ближайший Part
local function getClosestPart(parts)
    local closest = nil
    local minDist = maxDistance

    for _, part in ipairs(parts) do
        local dist = (camera.CFrame.Position - part.Position).Magnitude
        if dist < minDist then
            closest = part
            minDist = dist
        end
    end

    return closest
end

-- Главная логика
local allPrimaryParts = findAllPrimaryParts()
local closestPart = getClosestPart(allPrimaryParts)

if closestPart then
    camera.CFrame = CFrame.new(camera.CFrame.Position, closestPart.Position)
else
    warn("Нет доступных объектов 'Primary' в радиусе 400 studs.")
end
