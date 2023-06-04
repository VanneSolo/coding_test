io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

--require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
pi = math.pi
cosinus = math.cos
sinus = math.sin
arc_tan = math.atan
arc_tan_2 = math.atan2

function Arc_Tan_2(pY, pX)
  if pX == 0 then
    if pY < 0 then
      return -pi/2
    else
      return pi/2
    end
  end
  if pX > 0 then
    return arc_tan(pY/pX)
  end
  if pX < 0 then
    return pi + arc_tan(pY/pX)
  end
end

angle = 0
angle_speed = pi/2

x = 100*cosinus(angle)
y = 100*sinus(angle)
theta = arc_tan(y/x)
theta_2 = arc_tan_2(y, x)
theta_3 = Arc_Tan_2(y, x)

function love.load()
  
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    angle = angle+angle_speed*dt
  end
  if love.keyboard.isDown("left") then
    angle = angle-angle_speed*dt
  end
  x = 100*cosinus(angle)
  y = 100*sinus(angle)
  
  theta = arc_tan(y/x)
  theta_2 = arc_tan_2(y, x)
  theta_3 = Arc_Tan_2(y, x)
end

function love.draw()
  love.graphics.circle("fill", largeur/2, hauteur/2, 10)
  
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", largeur/2 + x, hauteur/2 + y, 5)
  love.graphics.print("angle: "..tostring(angle), 5, 5)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", largeur/2 + 150*cosinus(theta), hauteur/2+150*sinus(theta), 5)
  love.graphics.print("theta: "..tostring(theta), 5, 5+16)
  
  love.graphics.setColor(0, 0, 1)
  love.graphics.circle("fill", largeur/2 + 200*cosinus(theta_2), hauteur/2 + 200*sinus(theta_2), 5)
  love.graphics.print("theta_2: "..tostring(theta_2), 5, 5+16*2)
  
  love.graphics.setColor(1, 1, 0)
  love.graphics.circle("fill", largeur/2 + 250*cosinus(theta_3), hauteur/2 + 250*sinus(theta_3), 5)
  love.graphics.print("theta_3: "..tostring(theta_3), 5, 5+16*3)
  love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
  
end