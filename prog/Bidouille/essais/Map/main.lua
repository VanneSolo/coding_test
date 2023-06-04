io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "dist"
require "vector"

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  map_width = 20
  map_height = 12
  tile_width = 30
  tile_height = 30
  
  carre = {}
  carre.x = largeur/2
  carre.y = hauteur/2
  carre.l = 30
  carre.h = 30
  
  test = {}
  
  for i=1, 12 do
    test[i] = {}
    for j=1, 20 do
      test[i][j] = 1
    end
  end
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    carre.y = carre.y - 10
  end
  if love.keyboard.isDown("right") then
    carre.x = carre.x + 10
  end
  if love.keyboard.isDown("down") then
    carre.y = carre.y + 10
  end
  if love.keyboard.isDown("left") then
    carre.x = carre.x - 10
  end
end

function love.draw()

  for i = 1, 12 do
    for j = 1, 20 do
      if test[i][j] == 1 then
        love.graphics.rectangle("line", j*30, i*30, 30, 30)
      end
    end
  end
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("line", carre.x, carre.y, carre.l, carre.h)
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.print(love.timer.getFPS(), 10, 10)
end