local normalModel = workspace:FindFirstChild("Regions")
    and workspace.Regions:FindFirstChild("Quill Lake")
    and workspace.Regions["Quill Lake"]:FindFirstChild("ClientBirds")
    and workspace.Regions["Quill Lake"].ClientBirds:FindFirstChild("Normal")

if not normalModel then
    warn("Не удалось найти модель 'Normal' по заданному пути.")
    return
end

local torsoModel = normalModel:FindFirstChild("Torso")
if not torsoModel then
    warn("Модель 'Torso' не найдена в 'Normal'.")
    return
end

local primaryParts = {}
for _, part in ipairs(torsoModel:GetDescendants()) do
    if part:IsA("BasePart") and part.Name == "Primary" then
        table.insert(primaryParts, part)
    end
end

local camera = workspace.CurrentCamera

local function aimAt(part)
    camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
end

for _, primary in ipairs(primaryParts) do
    aimAt(primary)
    wait(1) -- Можно уменьшить, если нужно быстрее
end
