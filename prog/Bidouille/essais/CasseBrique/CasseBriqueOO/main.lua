io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end
  
largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

require "balle"
require "raquette"
require "grille"

function love.load()
  Demarre(5, 15)
end


function love.update(dt)
  UpdateBalle(dt)
  UpdateRaquette()
end


function love.draw()
  DrawGrid(5, 15)
  DrawBalle()
  DrawRaquette()
end


function love.mousepressed(x, y, n)
  IsGlued()
end