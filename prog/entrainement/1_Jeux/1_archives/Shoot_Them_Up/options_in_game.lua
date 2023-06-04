-- Ecran d'options qui sera accessible à partir du menu pause
-- en jeu. Il comportera moins de paramètres que l'écran d'options
-- du menu.

local Settings = require("options_assets")

local Options_G = {}

function Options_G.Init()
  
end

function Options_G.Update(dt)
  
end

function Options_G.Draw()
  love.graphics.print("Options en cours de jeu.")
end

function Options_G.Keyboard(key)
  
end

function Options_G.Mouse(x, y, button)
  
end

return Options_G