io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  player = {}
  player.w = 50
  player.h = 10
  player.x = largeur/2-player.w/2
  player.y = hauteur-20
  
  clavier = true
  souris = false
end

function love.update(dt)
  if clavier then
    if love.keyboard.isDown("right") then
      player.x = player.x + 2
    elseif love.keyboard.isDown("left") then
      player.x = player.x - 2
    end
  elseif souris then
    souris_x, souris_y = love.mouse.getPosition()
    player.x = souris_x
  end
end

function love.draw()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
  love.graphics.print("clavier: "..tostring(clavier), 10, 10)
  love.graphics.print("souris: "..tostring(souris), 10, 10+16)
end

function love.keypressed(key)
  if key == "space" then
    if clavier then
      clavier = false
      souris = true
    elseif souris then
      clavier = true
      souris = false
    end
  end
end