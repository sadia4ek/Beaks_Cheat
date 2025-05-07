local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Beaks",
   Icon = 0,
   LoadingTitle = "Beaks",
   LoadingSubtitle = "Loading...",
   Theme = "Default"
})

local Tab = Window:CreateTab("🦜Birds🦜", 0)
local Section = Tab:CreateSection("Чит-функции")

-- Кнопка для загрузки скрипта
local Button = Tab:CreateButton({
    Name = "Активировать Aim",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sadia4ek/Beaks_Cheat/refs/heads/main/aim.lua"))()
    end,
})
