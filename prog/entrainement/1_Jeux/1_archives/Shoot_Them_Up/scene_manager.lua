--[[
   Le gestionnaire de scènes appelle les fonctions update, draw, keyboard et mouse des
   différentes scènes selon les besoins. J'ai placé une fonction Init dans chaque scène,
   ce n'est pas certain que ce soit utile ailleurs que dans le Game.
   
   Le menu est la scène courante par défaut au lancement du jeu.
   
   Il faudra voir également si inclure le menu pause et les menus d'options, surtout depuis
   le jeu, est possible.
]]

local Menu = require("menu")
local Options_M = require("options_in_menu")
local Game = require("game")
local Victoire = require("victoire")
local Defaite = require("defaite")
local Scene = {}

function Scene.Init()
  current_scene = "MENU"
end

function Scene.Update(dt)
  if current_scene == "MENU" then
    Menu.Update(dt)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Update(dt)
  elseif current_scene == "GAME" then
    Game.Update(dt)
  elseif current_scene == "VICTOIRE" then
    Victoire.Update(dt)
  elseif current_scene == "DEFAITE" then
    Defaite.Update(dt)
  end
end

function Scene.Draw()
  if current_scene == "MENU" then
    Menu.Draw()
  elseif current_scene == "OPTIONS_M" then
    Options_M.Draw()
  elseif current_scene == "GAME" then
    Game.Draw()
  elseif current_scene == "VICTOIRE" then
    Victoire.Draw()
  elseif current_scene == "DEFAITE" then
    Defaite.Draw()
  end
end

function Scene.Keyboard(key)
  if current_scene == "MENU" then
    Menu.Keyboard(key)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Keyboard(key)
  elseif current_scene == "GAME" then
    Game.Keyboard(key)
  elseif current_scene == "VICTOIRE" then
    Victoire.Keyboard(key)
  elseif current_scene == "DEFAITE" then
    Defaite.Keyboard(key)
  end
end

function Scene.Mouse(x, y, button)
  if current_scene == "MENU" then
    Menu.Mouse(x, y, button)
  elseif current_scene == "OPTIONS_M" then
    Options_M.Mouse(x, y, button)
  elseif current_scene == "GAME" then
    --Game.Mouse(x, y, button)
  elseif current_scene == "VICTOIRE" then
    Victoire.Mouse(x, y, button)
  elseif current_scene == "DEFAITE" then
    Defaite.Mouse(x, y, button)
  end
end

return Scene