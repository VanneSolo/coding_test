io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  pi = math.pi
  
  ship = {}
  ship.img = love.graphics.newImage("vaisseau_rouge.png")
  ship.x = largeur/2
  ship.y = hauteur/2
  ship.vx = 0
  ship.vy = 0
  ship.speed = 100
  ship.ox = ship.img:getWidth()/2
  ship.oy = ship.img:getHeight()/2
  ship.angle = 0
  ship.speed_angle = pi
  
  sat = {}
  sat.angle = 0
  sat.rayon = 100
  sat.x = 0
  sat.y = 0
end

function love.update(dt)
  if love.keyboard.isDown("left") then
    ship.angle = ship.angle - (ship.speed_angle*dt)
  end
  if love.keyboard.isDown("right") then
    ship.angle = ship.angle + (ship.speed_angle*dt)
  end
  
  if ship.angle >= 2*pi or ship.angle <= -2*pi then
    ship.angle = 0
  end
  
  ship.vx = ship.speed * math.cos(ship.angle)
  ship.vy = ship.speed * math.sin(ship.angle)
  
  if love.keyboard.isDown("up") then
    ship.x = ship.x + (ship.vx*dt)
    ship.y = ship.y + (ship.vy*dt)
  end
  
  sat.angle = sat.angle + pi * dt
  sat.x = ship.x + sat.rayon * (math.cos(sat.angle))
  sat.y = ship.y + sat.rayon * (math.sin(sat.angle))
end

function love.draw()
  love.graphics.draw(ship.img, ship.x, ship.y, ship.angle, 0.5, 0.5, ship.ox, ship.oy)
  love.graphics.circle("fill", sat.x, sat.y, 10)
  love.graphics.print("ship.angle: "..ship.angle.." rad.")
end