io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

--require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

depart = 400
max = 50
speed = 150
arrow = {}
arrow.x = depart
arrow.y = 285
arrow.speed = speed
arrow.img = love.graphics.newCanvas(60, 30)
function Load_Arrow()
  love.graphics.setCanvas(arrow.img)
  love.graphics.line(0, 15, 60, 15)
  love.graphics.polygon("fill", 50, 10, 50, 20, 60, 15)
  love.graphics.setCanvas()
end
arrow.Update = function(dt)
  arrow.x = arrow.x + arrow.speed*dt
  if arrow.x > depart+max then
    arrow.x = depart+max
    arrow.speed = -arrow.speed
  end
  if arrow.x < depart-max then
    arrow.x = depart-max
    arrow.speed = -arrow.speed
  end
end
arrow.Draw = function()
  love.graphics.draw(arrow.img, arrow.x, arrow.y)
end


arrow_sin = {}
arrow_sin.x = depart
arrow_sin.y = 220
arrow_sin.time = 0
arrow_sin.T = max/speed * 4
arrow_sin.pulsation = math.pi*2 / arrow_sin.T
arrow_sin.Update = function(dt)
  arrow_sin.time = arrow_sin.time + dt
  arrow_sin.x = depart + max * math.sin(arrow_sin.pulsation*arrow_sin.time)
  if arrow_sin.time > arrow_sin.T then
    arrow_sin.time = 0
  end
end
arrow_sin.Draw = function()
  love.graphics.setColor(0, 1, 1)
  love.graphics.draw(arrow.img, arrow_sin.x, arrow_sin.y)
  love.graphics.setColor(1, 1, 1)
end

function love.load()
  Load_Arrow()
end

function love.update(dt)
  arrow.Update(dt)
  arrow_sin.Update(dt)
end

function love.draw()
  love.graphics.line(depart-max, 0, depart-max, 600)
  love.graphics.line(depart+max+arrow.img:getWidth(), 0, depart+max+arrow.img:getWidth(), 600)
  
  arrow.Draw()
  arrow_sin.Draw()
  
  love.graphics.print("arrow_sin.time: "..tostring(arrow_sin.time), 5, 5)
end

function love.keypressed(key)
  
end