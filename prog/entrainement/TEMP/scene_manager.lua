local Game = require("game")
local Menu = require("menu")
local Scene = {}

function Scene.Init()
  current_scene = "MENU"
end

function Scene.Update(dt)
  if current_scene == "MENU" then
    Menu.Update(dt)
  elseif current_scene == "GAME" then
    Game.Update(dt)
  elseif current_scene == "VICTOIRE" then
    
  elseif current_scene == "DEFAITE" then
    
  end
end

function Scene.Draw()
  if current_scene == "MENU" then
    Menu.Draw()
  elseif current_scene == "GAME" then
    Game.Draw()
  elseif current_scene == "VICTOIRE" then
    
  elseif current_scene == "DEFAITE" then
    
  end
end

function Scene.Keyboard(key)
  if current_scene == "MENU" then
    Menu.Keyboard(key)
  elseif current_scene == "GAME" then
    Game.Keyboard(key)
  elseif current_scene == "VICTOIRE" then
    
  elseif current_scene == "DEFAITE" then
    
  end
end

function Scene.Mouse(x, y, button)
  if current_scene == "MENU" then
    Menu.Mouse(key)
  elseif current_scene == "GAME" then
    --Game.Keyboard(key)
  elseif current_scene == "VICTOIRE" then
    
  elseif current_scene == "DEFAITE" then
    
  end
end

return Scene