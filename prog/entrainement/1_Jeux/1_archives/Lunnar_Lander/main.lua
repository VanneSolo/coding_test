io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

local Scene = require("scene_manager")

function love.load()
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
  Scene.Keypressed(key)
end

function love.mousepressed(x, y, button)
  Scene.Mousepressed(x, y, button)
end