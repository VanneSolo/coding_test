io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
local myGame = require "game"

function love.load()
  LARGEUR = love.graphics.getWidth()
  HAUTEUR = love.graphics.getHeight()
  
  love.window.setMode(800, 600)
  love.window.setTitle("Map tests")
  
  myGame.Load()
end

function love.update(dt)
  myGame.Update(dt)
end

function love.draw()
  myGame.Draw()
end