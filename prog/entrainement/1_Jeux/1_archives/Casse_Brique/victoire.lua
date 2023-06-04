local Menu = require("menu")
local Game = require("game")

local Victoire = {}

function Victoire.Init()
  
end

function Victoire.Update(dt)
  
end

function Victoire.Draw()
  love.graphics.print("VICTOIRE", 5, 5)
  love.graphics.print("Menu: m", 5, 5+16)
  love.graphics.print("Rejouer: espace", 5, 5+16*2)
  love.graphics.print("Quitter: echap", 5, 5+16*3)
end

function Victoire.Keypressed(key)
  if key == "m" then
    current_scene = "MENU"
  elseif key == "space" then
    current_scene = "GAME"
    Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function Victoire.Mousepressed(x, y, button)
  
end

return Victoire