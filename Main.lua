local quilllake = -67.4444199, 122.165558, -364.498962, 0.243534893, 9.81960735e-09, 0.969892144, -1.58893521e-08, 1, -6.13469808e-09, -0.969892144, -1.39169458e-08, 0.243534893
local Beakwoods = 466.627106, 157.324265, 76.1878052, -0.10578429, -1.08180602e-08, 0.994389117, 2.54622794e-08, 1, 1.35878091e-08, -0.994389117, 2.67567888e-08, -0.10578429
local deadlands = -480.717896, 120.607491, -1209.12231, 0.386041969, -5.52601342e-08, 0.922481239, 8.16462986e-08, 1, 2.57362824e-08, -0.922481239, 6.53818972e-08, 0.386041969
local mountains = 85.2576523, 236.609894, 378.349762, 0.913315773, 2.6972506e-08, -0.407252103, 4.99962027e-09, 1, 7.74427846e-08, 0.407252103, -7.27658289e-08, 0.913315773
local baloon = 114.351761, 124.085983, -875.929321, 2.84733602e-07, 5.45039762e-13, -1, 1.66259049e-14, 1, 5.45039762e-13, 1, -1.66260591e-14, 2.84733602e-07
local merchant = -75.1038971, 120.484665, -367.854309, 0.977103651, -0, -0.212763846, 0, 1, -0, 0.212763846, 0, 0.977103651

local player = game.Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

-- Кнопка для загрузки скрипта
local Button = Tab:CreateButton({
    Name = "Aim Bot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sadia4ek/Beaks_Cheat/refs/heads/main/aim.lua"))()
    end,
})

local Button = Tab:CreateButton({
    Name = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sadia4ek/Beaks_Cheat/refs/heads/main/wh.lua"))()
    end,
})

local Button = Tab2:CreateButton({
    Name = "Teleport Quil Lake",
    Callback = function()
        player.Torso.CFrame(-67.4444199, 122.165558, -364.498962, 0.243534893, 9.81960735e-09, 0.969892144, -1.58893521e-08, 1, -6.13469808e-09, -0.969892144, -1.39169458e-08, 0.243534893)
    end,
})

local Button = Tab2:CreateButton({
    Name = "Teleport Beakwoods",
    Callback = function()
        player.Torso.CFrame(466.627106, 157.324265, 76.1878052, -0.10578429, -1.08180602e-08, 0.994389117, 2.54622794e-08, 1, 1.35878091e-08, -0.994389117, 2.67567888e-08, -0.10578429)
    end,
})

local Button = Tab2:CreateButton({
    Name = "Teleport Dead Lands",
    Callback = function()
        player.Torso.CFrame(-480.717896, 120.607491, -1209.12231, 0.386041969, -5.52601342e-08, 0.922481239, 8.16462986e-08, 1, 2.57362824e-08, -0.922481239, 6.53818972e-08, 0.386041969)
    end,
})

local Button = Tab2:CreateButton({
    Name = "Teleport Mount Beaks",
    Callback = function()
        player.Torso.CFrame(85.2576523, 236.609894, 378.349762, 0.913315773, 2.6972506e-08, -0.407252103, 4.99962027e-09, 1, 7.74427846e-08, 0.407252103, -7.27658289e-08, 0.913315773)
    end,
})
