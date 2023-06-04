io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  angle = math.pi
  centre = {x=50, y=hauteur/2}
  rayon = 50
  
  pos = {x = centre.x+math.cos(angle)*rayon, y = centre.y+math.sin(angle)*rayon}
  table_position = {}
end

function love.update(dt)
  angle = angle + 0.05
  
  if angle >= math.pi then
    pos = {x = centre.x+math.cos(angle)*rayon, y = centre.y+math.sin(angle)*rayon}
    table.insert(table_position, pos)
    if angle > 2*math.pi then
      angle = 0
      centre.x = centre.x + (2*rayon)
    end
  else
    pos = {x = centre.x+math.cos(math.pi-angle)*rayon, y = centre.y+math.sin(math.pi-angle)*rayon}
    table.insert(table_position, pos)
    if angle > math.pi-0.05 then
      centre.x = centre.x + (2*rayon)
    end
  end
end

function love.draw()
  love.graphics.circle("fill", pos.x, pos.y, 10)
  for k, pos in pairs(table_position) do
    love.graphics.points(pos.x, pos.y)
  end
end