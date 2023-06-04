local Pause = require("pause")

--local function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

local Game = {}
  
function Game.Init()
  love.graphics.setPointSize(3)
  
  ship = {}
  ship.w = 20
  ship.h = 50
  ship.x = largeur/2
  ship.y = hauteur/2
  ship.vx = 0
  ship.vy = 0
  ship.angle = 270
  ship.s = 10
  ship.img = love.graphics.newCanvas(ship.w, ship.h)
  function ship.asset()
    love.graphics.setCanvas(ship.img)
    love.graphics.rectangle("fill", 0, 0, 20, 50)
    love.graphics.setCanvas()
  end
  ship.asset()
end

function Game.Update(dt)
  
  if love.keyboard.isDown("right") then
    ship.angle = ship.angle + 90*dt
    if ship.angle > 360 then
      ship.angle = 0
    end
  end
  if love.keyboard.isDown("left") then
    ship.angle = ship.angle - 90*dt
    if ship.angle < 0 then
      ship.angle = 360
    end
  end
  if love.keyboard.isDown("up") then
    angle_rad = math.rad(ship.angle)
    force_x = math.cos(angle_rad) * (ship.s*dt)
    force_y = math.sin(angle_rad) * (ship.s*dt)
    if math.abs(force_x) <= 0.1 then
      force_x = 0
    end
    if math.abs(force_y) <= 0.1 then
      force_y = 0
    end
    ship.vx = ship.vx + force_x
    ship.vy = ship.vy + force_y
  end
  
  ship.vy = ship.vy + 0.6*dt
  
  if math.abs(ship.vx) > 1 then
    if ship.vx > 0 then
      ship.vx = 1
    else
      ship.vx = -1
    end
  end
  if math.abs(ship.vy) > 1 then
    if ship.vy > 0 then
      ship.vy = 1
    else
      ship.vy = -1
    end
  end
  
  ship.x = ship.x + ship.vx
  ship.y = ship.y + ship.vy
  
  if ship.y+ship.h/2 >= hauteur then
    ship.y = hauteur-ship.h/2
    ship.vy = 0
  end
end

function Game.Draw()
  love.graphics.print("Jeu", 5, 5)
  love.graphics.print("ship.vy: "..tostring(ship.vy), 5, 5+16)
  
  love.graphics.draw(ship.img, ship.x, ship.y, math.rad(ship.angle), 1, 1, ship.img:getWidth()/2, ship.img:getHeight()/2)
  love.graphics.print("angle_rad = "..tostring(angle_rad), 150, 5)
  love.graphics.print("force_x = "..tostring(force_x), 150, 5+16)
  love.graphics.print("force_y = "..tostring(force_y), 150, 5+16*2)
  love.graphics.setColor(1, 0, 0)
  love.graphics.points(ship.x, ship.y)
  love.graphics.setColor(1, 1, 1)
end

function Game.Keypressed(key)
  
end

function Game.Mousepressed(x, y, button)
  
end

return Game