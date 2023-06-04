local defaite = {}

function defaite.Update(dt)
  
end

function defaite.Draw()
  love.graphics.print("Vous avez perdu!", 5, 5)
  love.graphics.print("Appuyez sur M pour retourner au menu, Espace pour recommencer", 5, 5)
end

function defaite.Keyboard(key)
  if key == "m" then
    current_scene = "MENU"
  end
  if key == "space" then
    current_scene = "GAME"
    Game.Init()
  end
end

function defaite.Mouse(x, y, button)
  
end

return defaite