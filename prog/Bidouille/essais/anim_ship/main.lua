io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

require "vector"
require "dist"

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  player = {}
  player.img_ship = love.graphics.newImage("vaisseau_rouge.png")
  player.x = largeur/2
  player.y = hauteur/2
  player.turn = 0
  player.scale = 0.5
  player.ox = player.img_ship:getWidth()/2
  player.oy = player.img_ship:getHeight()/2
  player.cursorX = love.mouse.getX()
  player.cursorY = love.mouse.getY()
  player.dir = Distance(player.x, player.y, player.cursorX, player.cursorY, 2, 1, 1)
  
  shoot = {}
  shoot.bool = false
  shoot.x = player.x
  shoot.y = player.y
end

function love.update(dt)  
  angle_ship = math.angle(player.x, player.y, player.cursorX, player.cursorY)
end

function love.draw()
  love.graphics.draw(player.img_ship, player.x, player.y, player.rotate, player.scale, player.scale, player.ox, player.oy)
  
  if shoot.bool == true then
    love.graphics.circle("fill", shoot.x, shoot.y, 10)
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    shoot.bool = true
  end
end

function love.mousereleased(x, y, button)
  if shoot.bool == true then
    shoot.bool = false
  end
end