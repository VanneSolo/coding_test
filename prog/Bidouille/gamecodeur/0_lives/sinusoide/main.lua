io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  angle = 0
  x = 0
  y = 0
  p = {}
end

function love.update(dt)
  angle = angle + 0.2
  y = math.sin(angle) * 10
  x = x + 3
  
  xp = x + 100 * math.cos(x/20)
end

function love.draw()
  y = y + (hauteur/2)
  
  love.graphics.circle("fill", xp, y, 4)
  table.insert(p, {_x = xp, _y = y})
  
  for k,v in pairs(p) do
    love.graphics.points(v._x, v._y)
  end
end