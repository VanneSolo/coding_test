io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  player_1 = {}
  player_1.w = 50
  player_1.h = 10
  player_1.x = largeur/2-player_1.w/2
  player_1.y = hauteur-20
  player_1.s = 4
  
  player_2 = {}
  player_2.w = 50
  player_2.h = 10
  player_2.x = largeur/2-player_2.w/2
  player_2.y = 10
  player_2.s = 4
  
  ai = true
  humain = false
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    player_1.x = player_1.x + player_1.s
  end
  if love.keyboard.isDown("left") then
    player_1.x = player_1.x - player_1.s
  end
  
  if player_1.x >= largeur-player_1.w then
    player_1.x = largeur-player_1.w
  end
  if player_1.x <= 0 then
    player_1.x = 0
  end
  
  if ai then
    player_2.x = player_2.x + player_2.s
    if player_2.x >= largeur-player_2.w or player_2.x <= 0 then
      player_2.s = -player_2.s
    end
  elseif humain then
    player_2.s = 4
    if love.keyboard.isDown("q") then
      player_2.x = player_2.x - player_2.s
    elseif love.keyboard.isDown("d") then
      player_2.x = player_2.x + player_2.s
    end
    
    if player_2.x >= largeur-player_2.w then
      player_2.x = largeur-player_2.w
    end
    if player_2.x <= 0 then
      player_2.x = 0
    end
  end
end

function love.draw()
  love.graphics.rectangle("fill", player_1.x, player_1.y, player_1.w, player_1.h)
  love.graphics.rectangle("fill", player_2.x, player_2.y, player_2.w, player_2.h)
end

function love.keypressed(key)
  if key == "space" then
    if ai then
      ai = false
      humain = true
    elseif humain then
      ai = true
      humain = false
    end
  end
end