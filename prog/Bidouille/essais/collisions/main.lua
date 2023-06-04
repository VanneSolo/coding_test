io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
--if arg[arg] == "-debug" then require("mobdebug").start() end

require "oop"
require "vector_2"
require "polygon"
require "rectangle"

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  box_1 = {}
  box_1.x = 150
  box_1.y = 150
  box_1.img = love.graphics.newImage("square.png")
  box_1.width = box_1.img:getWidth()
  box_1.height = box_1.img:getHeight()
  box_1.rotation = 0
  box_1.collider = new "Rectangle" (new "Vector_2"(box_1.x, box_1.y), new "Vector_2"(box_1.width, box_1.height))
  --box_1.hitbox = 0
  
  box_2 = {}
  box_2.x = largeur/2
  box_2.y = hauteur/2
  box_2.img = love.graphics.newImage("square.png")
  box_2.width = box_2.img:getWidth()
  box_2.height = box_2.img:getHeight()
  box_2.rotation = 0
  box_2.collider = new "Rectangle" (new "Vector_2"(box_2.x, box_2.y), new "Vector_2"(box_2.width, box_2.height))
  
  collides = false
  contour = 0
  contour2 = 0
end

function love.update(dt)
  local souris_x, souris_y = love.mouse.getPosition()
  box_1.collider = new "Rectangle" (new"Vector_2"(souris_x, souris_y), new"Vector_2"(box_1.width, box_1.height))
  box_1.x = souris_x
  box_1.y = souris_y

  collides = box_1.collider:collides(box_2.collider, box_1.rotation, box_2.rotation)

end

function love.draw()
  if collides == true then
    love.graphics.setColor(0, 255, 0, 1)
  end
  
  love.graphics.draw(box_1.img, box_1.x, box_1.y, box_1.rotation, 1, 1, box_1.width/2, box_1.height/2)
  love.graphics.draw(box_2.img, box_2.x, box_2.y, box_2.rotation, 1, 1, box_2.width/2, box_2.height/2)
  love.graphics.setColor(255, 255, 255, 1)
  
  contour = box_1.collider:Draw_Polygone(box_1.rotation)
  contour2 = box_2.collider:Draw_Polygone(box_2.rotation)
end

function love.wheelmoved(x, y)
  local var = math.rad(3*y)
  box_1.rotation = box_1.rotation + var
end

function love.keypressed(key)
  if key == "up" then
    local var = math.rad(10)
    box_1.rotation = box_1.rotation + var
  end
  if key == "down" then
    local var = math.rad(-10)
    box_1.rotation = box_1.rotation + var
  end
end