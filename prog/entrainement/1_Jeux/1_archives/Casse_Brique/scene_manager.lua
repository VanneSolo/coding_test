local Menu = require("menu")
local Options_M = require("options_in_menu")
local Options_G = require("options_in_game")
local Victoire = require("victoire")
local Defaite = require("defaite")
local Pause = require("pause")
local Game = require("game")

local Scene = {}

function Scene.Init()
  current_scene = "MENU"
end

function Scene.Update(dt)
  if current_scene == "MENU" then
    Menu.Update(dt)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Update(dt)
  elseif current_scene == "OPTIONS_G" then
    Options_G.Update(dt)
  elseif current_scene == "VICTOIRE" then
    Victoire.Update(dt)
  elseif current_scene == "DEFAITE" then
    Defaite.Update(dt)
  elseif current_scene == "PAUSE" then
    Pause.Update(dt)
  elseif current_scene == "GAME" then
    Game.Update(dt)
  end
end

function Scene.Draw()
  if current_scene == "MENU" then
    Menu.Draw()
  elseif current_scene == "OPTIONS_M" then
    Options_M.Draw()
  elseif current_scene == "OPTIONS_G" then
    Options_G.Draw()
  elseif current_scene == "VICTOIRE" then
    Victoire.Draw()
  elseif current_scene == "DEFAITE" then
    Defaite.Draw()
  elseif current_scene == "PAUSE" then
    Pause.Draw()
  elseif current_scene == "GAME" then
    Game.Draw()
  end
end

function Scene.Keypressed(key)
  if current_scene == "MENU" then
    Menu.Keypressed(key)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Keypressed(key)
  elseif current_scene == "OPTIONS_G" then
    Options_G.Keypressed(key)
  elseif current_scene == "VICTOIRE" then
    Victoire.Keypressed(key)
  elseif current_scene == "DEFAITE" then
    Defaite.Keypressed(key)
  elseif current_scene == "PAUSE" then
    Pause.Keypressed(key)
  elseif current_scene == "GAME" then
    Game.Keypressed(key)
  end
end

function Scene.Mousepressed(x, y, button)
  if current_scene == "MENU" then
    Menu.Mousepressed(x, y, button)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Mousepressed(x, y, button)
  elseif current_scene == "OPTIONS_G" then
    Options_G.Mousepressed(x, y, button)
  elseif current_scene == "VICTOIRE" then
    Victoire.Mousepressed(x, y, button)
  elseif current_scene == "DEFAITE" then
    Defaite.Mousepressed(x, y, button)
  elseif current_scene == "PAUSE" then
    Pause.Mousepressed(x, y, button)
  elseif current_scene == "GAME" then
    Game.Mousepressed(x, y, button)
  end
end

return Scene