io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

local myGame = require "game"

function love.load()
  LARGEUR = love.graphics.getWidth()
  HAUTEUR = love.graphics.getHeight()
  
  love.window.setMode(800, 600)
  love.window.setTitle("Map tests")
  
  myGame.Load()
end

function love.update(dt)
  
end

function love.draw()
  myGame.Draw()
end