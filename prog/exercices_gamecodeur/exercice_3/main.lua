io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  PI = math.pi
  
  pv = 5
  
  chrono = 2
end

function love.update(dt)
  
end

function love.draw()
  a = math.abs(math.cos(love.timer.getTime() * chrono % 2 * math.pi))
  
  coeur_gauche = love.graphics.newCanvas(40, 30)
  coeur_droit = love.graphics.newCanvas(40, 30)
  
  love.graphics.setCanvas(coeur_gauche)
    love.graphics.arc("fill", "open", 20, 15, 10, PI/2, (3*PI)/2)
  love.graphics.setCanvas()
  
  love.graphics.setCanvas(coeur_droit)
    love.graphics.arc("fill", "open", 0, 15, 10, PI/2, -PI/2)
  love.graphics.setCanvas()
  
  
  for i=1, pv do
    if i%2 ~= 0 then
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(coeur_gauche, i*20, 15)
      if pv == 1 then
        love.graphics.setColor(1, 1, 1, a)
      end
    else
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(coeur_droit, i*20, 15)
    end
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "up" then
    pv = pv + 1
  end
  
  if key == "down" then
    pv = pv - 1
  end
end