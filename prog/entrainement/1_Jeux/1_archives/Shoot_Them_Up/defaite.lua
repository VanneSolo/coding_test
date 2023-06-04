--[[

    Scène qui se lance en cas de défaite. Mêmes fonctions que pour la scène
    de victoire (rejouer, retour menu ou quitter) mais visuels différents.

]]

local Game = require("game")
local defaite = {}

function defaite.Update(dt)
  
end

function defaite.Draw()
  love.graphics.print("Vous avez perdu!", 5, 5)
  love.graphics.print("Appuyez sur M pour retourner au menu, Espace pour recommencer", 5, 5+16)
  love.graphics.print("Quitter: echap", 5, 5+16*2)
end

function defaite.Keyboard(key)
  if key == "m" then
    current_scene = "MENU"
  elseif key == "space" then
    current_scene = "GAME"
    Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function defaite.Mouse(x, y, button)
  
end

return defaite