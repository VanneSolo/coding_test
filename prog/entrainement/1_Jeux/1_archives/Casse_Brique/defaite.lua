local Menu = require("menu")
local Game = require("game")

local Defaite = {}

function Defaite.Init()
  
end

function Defaite.Update(dt)
  
end

function Defaite.Draw()
  love.graphics.print("DEFAITE", 5, 5)
  love.graphics.print("Menu: m", 5, 5+16)
  love.graphics.print("Rejouer: espace", 5, 5+16*2)
  love.graphics.print("Quitter: echap", 5, 5+16*3)
end

function Defaite.Keypressed(key)
  if key == "m" then
    current_scene = "MENU"
  elseif key == "space" then
    current_scene = "GAME"
    Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function Defaite.Mousepressed(x, y, button)
  
end

return Defaite