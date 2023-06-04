io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
love.graphics.setPointSize(3)

spawn = {}
spawn[1] = {x = largeur/2, y = 50}
spawn[2] = {x = largeur/2, y = hauteur/2}
spawn[3] = {x = largeur/2, y = hauteur-50}

balle = {}
balle.w = 5
balle.h = 5
balle.x = 0
balle.y = 0
balle.vit_x = 0
balle.vit_y = 0

raquette = {}
raquette.w = 10
raquette.h = 50
raquette.x = 20
raquette.y = 0

rnd_spawn = love.math.random(1, 3)

function Balle_Spawn()
  if rnd_spawn == 1 then
    balle.x = spawn[1].x-balle.w/2
    balle.y = spawn[1].y-balle.h/2
  elseif rnd_spawn == 2 then
    balle.x = spawn[2].x-balle.w/2
    balle.y = spawn[2].y-balle.h/2
  else
    balle.x = spawn[3].x-balle.w/2
    balle.y = spawn[3].y-balle.h/2
  end
end

function Balle_Direction()
  if rnd_spawn == 1 then
    local dir_x = love.math.random(1,2)
    if dir_x == 1 then
      balle.vit_x = 2
      balle.vit_y = 2
    else
      balle.vit_x = -2
      balle.vit_y = 2
    end
  elseif rnd_spawn == 2 then
    local dir_x = love.math.random(1, 2)
    local dir_y = love.math.random(1, 2)
    if dir_x == 1 then
      if dir_y == 1 then
        balle.vit_x = 2
        balle.vit_y = 2
      else
        balle.vit_x = 2
        balle.vit_y = -2
      end
    else
      if dir_y == 1 then
        balle.vit_x = -2
        balle.vit_y = 2
      else
        balle.vit_x = -2
        balle.vit_y = -2
      end
    end
  else
    local dir_x = love.math.random(1,2)
    if dir_x == 1 then
      balle.vit_x = 2
      balle.vit_y = -2
    else
      balle.vit_x = -2
      balle.vit_y = -2
    end
  end
end

function love.load()
  Balle_Spawn()
  Balle_Direction()
  raquette.y = balle.y + balle.h/2 - raquette.h/2
end

function love.update(dt)
  if balle.x >= largeur or balle.x+balle.x <= 0 then
    rnd_spawn = love.math.random(1, 3)
    Balle_Spawn()
    Balle_Direction()
    raquette.y = balle.y + balle.h/2 - raquette.h/2
  end
  
  if balle.y+balle.h >= hauteur or balle.y <= 0 then
    balle.vit_y = -balle.vit_y
  end
  
  balle.x = balle.x + balle.vit_x
  balle.y = balle.y + balle.vit_y
end

function love.draw()
  for i=1,#spawn do
    love.graphics.points(spawn[i].x, spawn[i].y)
  end
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", balle.x, balle.y, balle.w, balle.h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", raquette.x, raquette.y, raquette.w, raquette.h)
end

function love.keypressed(key)
  if key == "space" then
    rnd_spawn = love.math.random(1, 3)
    Balle_Spawn()
    Balle_Direction()
    raquette.y = balle.y + balle.h/2 - raquette.h/2
  end
end