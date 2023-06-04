io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

--require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
pi = math.pi

draw_test = {}
draw_test.w = 40
draw_test.h = 20
draw_test.x = largeur/2
draw_test.y = hauteur/2
draw_test.vx = 0
draw_test.vy = 0
draw_test.speed = 100
draw_test.angle = 0
draw_test.rotation = pi
draw_test.img = love.graphics.newCanvas(draw_test.w, draw_test.h)
draw_test.Load = function()
  love.graphics.setCanvas(draw_test.img)
  love.graphics.setColor(0.08, 0.45, 0.78)
  love.graphics.rectangle("fill", 0, 0, 40, 20)
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", 30, 7, 6, 6)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

satellite = {}
satellite.angle = 0
satellite.r = 60
satellite.x = draw_test.x + satellite.r*math.cos(satellite.angle)
satellite.y = draw_test.y + satellite.r*math.sin(satellite.angle)

function love.load()
  draw_test.Load()
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    draw_test.angle = draw_test.angle + draw_test.rotation*dt
  end
  if love.keyboard.isDown("left") then
    draw_test.angle = draw_test.angle - draw_test.rotation*dt
  end
  
  if draw_test.angle > 2*pi or draw_test.angle < -2*pi then
    draw_test.angle = 0
  end
  
  satellite.angle = satellite.angle + pi*dt
  satellite.x = draw_test.x + satellite.r*math.cos(satellite.angle)
  satellite.y = draw_test.y + satellite.r*math.sin(satellite.angle)
  
  draw_test.vx = draw_test.speed * math.cos(draw_test.angle)
  draw_test.vy = draw_test.speed * math.sin(draw_test.angle)
  if love.keyboard.isDown("up") then
    draw_test.x = draw_test.x + draw_test.vx*dt
    draw_test.y = draw_test.y + draw_test.vy*dt
  end
end

function love.draw()
  love.graphics.line(400, 0, 400, 600)
  love.graphics.line(0, 300, 800, 300)
  love.graphics.draw(draw_test.img, draw_test.x, draw_test.y, draw_test.angle, 1, 1, draw_test.img:getWidth()/2, draw_test.img:getHeight()/2)
  
  love.graphics.circle("fill", satellite.x, satellite.y, 5)
  
  love.graphics.print("ship angle: "..tostring(draw_test.angle).." rad.", 5, 5)
end

function love.keypressed(key)
  
end