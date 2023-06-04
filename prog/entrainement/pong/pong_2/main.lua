io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
speed = 5
pad_largeur = 10
pad_longueur = 50

ground = {}
ground.w = 450
ground.h = 300
ground.x = 100
ground.y = 100
ground.canvas = love.graphics.newCanvas(ground.w, ground.h)
love.graphics.setCanvas(ground.canvas)
love.graphics.setColor(0, 1, 0)
love.graphics.rectangle("fill", 0, 0, ground.w, ground.h)
love.graphics.setColor(1, 1, 1)
love.graphics.setCanvas()
ground.current_dir = "HORIZONTAL"

loc_l = ground.canvas:getWidth()
loc_h = ground.canvas:getHeight()
cur_largeur = ground.w
cur_hauteur = ground.h

balle = {}
balle.r = 5
balle.x = 0
balle.y = 0
balle.vx = speed
balle.vy = speed

pad = {}
pad.w = pad_largeur
pad.h = pad_longueur
pad.x = 0
pad.y = 0
pad.vx = 0
pad.vy = 0
pad.pos_x = "LEFT"
pad.pos_y = "TOP"

function love.load()
  balle.x = ground.x+(cur_largeur/2)
  balle.y = ground.y+(cur_hauteur/2)
  
  pad.x = ground.x + 10
  pad.y = ground.y + cur_hauteur/2-pad.h/2
  
  pad.vx = 0
  pad.vy = speed
end

function love.update(dt)
  if ground.current_dir == "HORIZONTAL" then
    cur_largeur = ground.w
    cur_hauteur = ground.h
    pad.w = pad_largeur
    pad.h = pad_longueur
    if pad.y >= ground.y+cur_hauteur-pad.h then
      pad.y = ground.y+cur_hauteur-pad.h
      pad.vy = -pad.vy
    elseif pad.y <= ground.y then
      pad.y = ground.y
      pad.vy = -pad.vy
    end
  elseif ground.current_dir == "VERTICAL" then
    cur_largeur = ground.h
    cur_hauteur = ground.w
    pad.w = pad_longueur
    pad.h = pad_largeur
    if pad.x >= ground.x+cur_largeur-pad.w then
      pad.x = ground.x+cur_largeur-pad.w
      pad.vx = -pad.vx
    elseif pad.x <= ground.x then
      pad.x = ground.x
      pad.vx = -pad.vx
    end
  end
  
  if balle.x < ground.x+balle.r then
    balle.x = ground.x+balle.r
    balle.vx = -balle.vx
  elseif balle.x > ground.x+cur_largeur-balle.r then
    balle.x = ground.x+cur_largeur-balle.r
    balle.vx = -balle.vx
  end
  if balle.y < ground.y+balle.r then
    balle.y = ground.y+balle.r
    balle.vy = -balle.vy
  elseif balle.y > ground.y+cur_hauteur-balle.r then
    balle.y = ground.y+cur_hauteur-balle.r
    balle.vy = -balle.vy
  end
  
  balle.x = balle.x + balle.vx*60*dt
  balle.y = balle.y + balle.vy*60*dt
  
  pad.x = pad.x + pad.vx*60*dt
  pad.y = pad.y + pad.vy*60*dt
end

function love.draw()
  if ground.current_dir == "HORIZONTAL" then
    love.graphics.draw(ground.canvas, ground.x, ground.y, 0)
  elseif ground.current_dir == "VERTICAL" then
    love.graphics.draw(ground.canvas, ground.x+ground.h, ground.y, math.rad(90))
  end
  
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
  love.graphics.rectangle("fill", pad.x, pad.y, pad.w, pad.h)
end

function love.keypressed(key)
  if key == "space" then
    if ground.current_dir == "HORIZONTAL" then
      ground.current_dir = "VERTICAL"
      pad.x = ground.x + cur_largeur/2-pad.w/2
      pad.y = ground.y + 10
      pad.vx = speed
      pad.vy = 0
    elseif ground.current_dir == "VERTICAL" then
      ground.current_dir = "HORIZONTAL"
      pad.x = ground.x + 10
      pad.y = ground.y + cur_hauteur/2-pad.h/2
      pad.vx = 0
      pad.vy = speed
    end
  end
  if ground.current_dir == "HORIZONTAL" then
    if key == "right" and pad.pos_x == "LEFT" then
      pad.pos_x = "RIGHT"
      pad.x = ground.x + cur_largeur-10 - pad.w
    elseif key == "left" and pad.pos_x == "RIGHT" then
      pad.pos_x = "LEFT"
      pad.x = ground.x + 10
    end
  elseif ground.current_dir == "VERTICAL" then
    if key == "down" and pad.pos_y == "TOP" then
      pad.pos_y = "BOTTOM"
      pad.y = ground.y + cur_hauteur-10 - pad.h
    elseif key == "up" and pad.pos_y == "BOTTOM" then
      pad.pos_y = "TOP"
      pad.y = ground.y + 10
    end
  end
end