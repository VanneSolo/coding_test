io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

--[[
  TO DO
  
  -> Créer différents types d'aliens.
  -> Créer des boss.
  -> Créer des effets d'explosion.
  -> Créer des patterns pour les aliens.
  -> Créer différents niveaux.
  -> Rendre les menus plus présentables.
  -> Rendre les menus navigables à la souris.
  -> Créer un menu pause.
]]

local Scene = require("scene_manager")

largeur = 0
hauteur = 0

function love.load()
  love.window.setMode(1024, 768)
  love.window.setTitle("Primitives ShMup")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Scene.Init()
end

function love.update(dt)
  Scene.Update(dt)
end

function love.draw()
  Scene.Draw()
end

function love.keypressed(key)
  Scene.Keyboard(key)
end

function love.mousepressed(x, y, button)
  
end