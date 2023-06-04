--[[

     Scène qui se déclenche en cas de victoire. On peut lancer une nouvelle
     partie, retourner au menu ou quitter.

]]

local Game = require("game")
local victoire = {}

function victoire.Update(dt)
  
end

function victoire.Draw()
  love.graphics.print("Vous avez gagné!", 5, 5)
  love.graphics.print("Appuyez sur M pour retourner au menu, Espace pour recommencer", 5, 5+16)
  love.graphics.print("Quitter: echap", 5, 5+16*2)
end

function victoire.Keyboard(key)
  if key == "m" then
    current_scene = "MENU"
  elseif key == "space" then
    current_scene = "GAME"
    Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function victoire.Mouse(x, y, button)
  
end

return victoire