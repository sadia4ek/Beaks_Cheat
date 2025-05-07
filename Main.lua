local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Beaks",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Beaks ",
   LoadingSubtitle = "Loading...",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

  local Section = Tab:CreateSection("Section Example")
    
  local Tab = Window:CreateTab("🦜Birds🦜", 0)
    
