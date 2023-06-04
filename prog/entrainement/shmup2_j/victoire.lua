local Game = require("game")
local victoire = {}

function victoire.Update(dt)
  
end

function victoire.Draw()
  love.graphics.print("Vous avez gagné!", 5, 5)
  love.graphics.print("Appuyez sur M pour retourner au menu, Espace pour recommencer", 5, 5+16)
end

function victoire.Keyboard(key)
  if key == "m" then
    current_scene = "MENU"
  end
  if key == "space" then
    current_scene = "GAME"
    Game.Init()
  end
end

function victoire.Mouse(x, y, button)
  
end

return victoire