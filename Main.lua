local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local player = game.Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "Beaks",
   Icon = 0,
   LoadingTitle = "Beaks",
   LoadingSubtitle = "Loading...",
   Theme = "DarkBlue"
})

local Tab = Window:CreateTab("Birds", 0)
local Tab2 = Window:CreateTab("Teleport", 0)
local Section = Tab:CreateSection("Aim")

-- Aim Bot
Tab:CreateButton({
    Name = "Aim Bot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sadia4ek/Beaks_Cheat/refs/heads/main/aim.lua"))()
    end,
})

-- ESP (только в указанных регионах)
Tab:CreateButton({
    Name = "ESP (1000 studs, по регионам)",
    Callback = function()
        -- Удаление старых ESP
        for _, h in ipairs(game.CoreGui:GetChildren()) do
            if h:IsA("Highlight") and h.Name == "BeaksESP" then
                h:Destroy()
            end
        end

        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")
        local maxDistance = 1000

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

        -- Список регионов
        local regions = {
            "Quill Lake",
            "Beakwoods",
            "DeadLands",
            "Mount Beaks"
        }

        for _, regionName in ipairs(regions) do
            local success, torsoModel = pcall(function()
                return workspace.Regions[regionName].ClientBirds.Normal.Torso
            end)

            if success and typeof(torsoModel) == "Instance" then
                for _, part in ipairs(torsoModel:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name == "Primary" then
                        local dist = (part.Position - root.Position).Magnitude
                        if dist <= maxDistance then
                            highlightPart(part)
                        end
                    end
                end
            end
        end
    end,
})

-- Телепорт-функция
local function teleportTo(cframeData)
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(unpack(cframeData))
    end
end

-- Координаты
local locations = {
    ["Quil Lake"] = {
        -67.4444199, 122.165558, -364.498962,
        0.243534893, 9.81960735e-09, 0.969892144,
        -1.58893521e-08, 1, -6.13469808e-09,
        -0.969892144, -1.39169458e-08, 0.243534893
    },
    ["Beakwoods"] = {
        466.627106, 157.324265, 76.1878052,
        -0.10578429, -1.08180602e-08, 0.994389117,
        2.54622794e-08, 1, 1.35878091e-08,
        -0.994389117, 2.67567888e-08, -0.10578429
    },
    ["Dead Lands"] = {
        -480.717896, 120.607491, -1209.12231,
        0.386041969, -5.52601342e-08, 0.922481239,
        8.16462986e-08, 1, 2.57362824e-08,
        -0.922481239, 6.53818972e-08, 0.386041969
    },
    ["Mount Beaks"] = {
        85.2576523, 236.609894, 378.349762,
        0.913315773, 2.6972506e-08, -0.407252103,
        4.99962027e-09, 1, 7.74427846e-08,
        0.407252103, -7.27658289e-08, 0.913315773
    }
}

-- Кнопки телепорта
for name, cframeData in pairs(locations) do
    Tab2:CreateButton({
        Name = "Teleport to " .. name,
        Callback = function()
            teleportTo(cframeData)
        end,
    })
end
