local Options_M = require("options_in_menu")
local Game = require("game")

local Menu = {}

function Menu.Init()
  
end

function Menu.Update(dt)
  
end

function Menu.Draw()
  love.graphics.print("Menu", 5, 5)
  love.graphics.print("Jouer: espace", 5, 5+16)
  love.graphics.print("Options: o", 5, 5+16*2)
  love.graphics.print("Quitter: echap", 5, 5+16*3)
end

function Menu.Keypressed(key)
  if key == "space" then
    current_scene = "GAME"
    Game.Init()
  elseif key == "o" then
    current_scene = "OPTIONS_M"
  elseif key == "escape" then
    love.event.quit()
  end
end

function Menu.Mousepressed(x, y, button)
  
end

return Menu