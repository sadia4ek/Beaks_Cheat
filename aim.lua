local maxDistance = 400

-- Поиск модели Normal по полному пути
local normalModel = workspace:FindFirstChild("Regions")
    and workspace.Regions:FindFirstChild("Quill Lake")
    and workspace.Regions["Quill Lake"]:FindFirstChild("ClientBirds")
    and workspace.Regions["Quill Lake"].ClientBirds:FindFirstChild("Normal")

if not normalModel then
    warn("Не найдена модель 'Normal'")
    return
end

-- Поиск Torso
local torsoModel = normalModel:FindFirstChild("Torso")
if not torsoModel then
    warn("Не найдена модель 'Torso'")
    return
end

-- Получение всех Primary-партов
local primaryParts = {}
for _, part in ipairs(torsoModel:GetDescendants()) do
    if part:IsA("BasePart") and part.Name == "Primary" then
        table.insert(primaryParts, part)
    end
end

-- Нахождение ближайшего из них к камере (в пределах 400 studs)
local camera = workspace.CurrentCamera
local closestPart = nil
local shortestDistance = maxDistance

for _, part in ipairs(primaryParts) do
    local distance = (camera.CFrame.Position - part.Position).Magnitude
    if distance < shortestDistance then
        closestPart = part
        shortestDistance = distance
    end
end

-- Если найден подходящий Part — прицелиться
if closestPart then
    camera.CFrame = CFrame.new(camera.CFrame.Position, closestPart.Position)
else
    warn("Нет объектов 'Primary' в радиусе 400 studs.")
end
