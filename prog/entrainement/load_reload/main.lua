io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

function Game_Init()
  timer = 15
  
  balle = {}
  balle.x = largeur/2
  balle.y = hauteur/2
  balle.r = 6
  balle.vx = 5
  balle.vy = 5
end

function Game_Update(dt)
  if balle.x >= largeur-balle.r then
    balle.x = largeur-balle.r
    balle.vx = -balle.vx
  elseif balle.x <= balle.r then
    balle.x = balle.r
    balle.vx = -balle.vx
  end
  if balle.y >= hauteur-balle.r then
    balle.y = hauteur-balle.r
    balle.vy = -balle.vy
  elseif balle.y <= balle.r then
    balle.y = balle.r
    balle.vy = -balle.vy
  end
  balle.x = balle.x + balle.vx
  balle.y = balle.y + balle.vy
end

function Game_Draw()
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Game_Init()
end

function love.update(dt)
  timer = timer-dt
  
  if timer >= 0 then
    Game_Update(dt)
  else
    timer = 0
  end
end

function love.draw()
  love.graphics.print("chrono: "..tostring(timer), 5, 5)
  Game_Draw()
end

function love.keypressed(key)
  if key == "space" then
    Game_Init()
  end
end