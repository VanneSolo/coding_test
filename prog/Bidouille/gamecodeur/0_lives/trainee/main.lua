io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  joueur = {}
  joueur.x = largeur/2
  joueur.y = hauteur/2
  joueur.r = 5
  joueur.v = 2
  
  liste_traine = {}
end

function love.update(dt)
  for i=#liste_traine,1,-1 do
    local queue = liste_traine[i]
    queue.vie = queue.vie - dt
    queue.x = queue.x + queue.vx
    queue.y = queue.y + queue.vy
    if queue.vie <= 0 then
      table.remove(liste_traine, i)
    end
  end
  
  local part_traine = {}
  part_traine.x = joueur.x
  part_traine.y = joueur.y
  part_traine.vx = love.math.random(-1, 1)
  part_traine.vy = love.math.random(-1, 1)
  part_traine.vie = 0.5
  table.insert(liste_traine, part_traine)
  
  if love.keyboard.isDown("up") then
    joueur.y = joueur.y - joueur.v
  end
  if love.keyboard.isDown("right") then
    joueur.x = joueur.x + joueur.v
  end
  if love.keyboard.isDown("down") then
    joueur.y = joueur.y + joueur.v
  end
  if love.keyboard.isDown("left") then
    joueur.x = joueur.x - joueur.v
  end
end

function love.draw()
  for i=1,#liste_traine do
    local queue = liste_traine[i]
    love.graphics.setColor(1, 1, 1, queue.vie/2)
    love.graphics.circle("fill", queue.x, queue.y, joueur.r)
  end
  
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.circle("fill", joueur.x, joueur.y, joueur.r)
end