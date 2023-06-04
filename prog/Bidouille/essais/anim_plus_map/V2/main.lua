io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "hero"
require "sprite2"

function love.load()
  
end

function love.update(dt)
  updateImages(dt, hero)
  updateImages(dt, truc)
  
  updateHero()
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
  
  drawImages(hero)
  drawImages(truc)
end