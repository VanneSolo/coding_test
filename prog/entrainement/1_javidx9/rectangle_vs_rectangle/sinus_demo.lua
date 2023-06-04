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

point = {}
point.angle = 0
point.speed = pi/2
point.r = 100
point.x = point.r * cosinus(point.angle)
point.y = point.r * sinus(point.angle)
point.Update = function(dt)
  point.angle = point.angle + point.speed*dt
  point.x = point.r * cosinus(point.angle)
  point.y = point.r * sinus(point.angle)
end
point.Draw = function()
  love.graphics.circle("fill", point.x, point.y, 10)
end

canvas = love.graphics.newCanvas(800, 600)

function love.load()
  
end

function love.update(dt)
  point.Update(dt)
end

function love.draw()
  love.graphics.setCanvas(canvas)
  love.graphics.line(0, 100, 400, 100)
  love.graphics.setColor(0, 1, 0)
  love.graphics.points(15*point.angle, point.y + 100)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
  
  love.graphics.translate(150, 300)
  love.graphics.line(-150, 0, 150, 0)
  love.graphics.line(0, -150, 0, 150)
  
  love.graphics.circle("line", 0, 0, point.r)
  point.Draw()
  
  love.graphics.line(point.x, 0, point.x, point.y)
  love.graphics.line(0, point.y, point.x, point.y)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.line(0, 0, point.x, 0)
  
  love.graphics.setColor(0, 1, 0)
  love.graphics.line(0, 0, 0, point.y)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(canvas, 200, -100)
  
  love.graphics.print("angle: "..tostring(point.angle), -100, -250)
  love.graphics.setColor(1, 0, 0)
  love.graphics.print("cos(angle: "..tostring(cosinus(point.angle)), -100, -250+16)
  love.graphics.setColor(0, 1, 0)
  love.graphics.print("sin(angle: "..tostring(sinus(point.angle)), -100, -250+16*2)
  love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
  
end