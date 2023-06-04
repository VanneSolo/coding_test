io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  perso = {}
  perso.x = 10
  perso.y = 300
  perso.r = 5
  perso.speed_x = 0
  perso.speed_y = 0
  
  max_speed = 6
end

function love.update(dt)
  if math.abs(perso.speed_x) < max_speed then
    if love.keyboard.isDown("right") then
      perso.speed_x = perso.speed_x + 0.2
    end
    if love.keyboard.isDown("left") then
      perso.speed_x = perso.speed_x - 0.2
    end
  end
  if math.abs(perso.speed_y) < max_speed then
    if love.keyboard.isDown("up") then
      perso.speed_y = perso.speed_y - 0.2
    end
    if love.keyboard.isDown("down") then
      perso.speed_y = perso.speed_y + 0.2
    end
  end
  perso.x = perso.x + perso.speed_x
  perso.y = perso.y + perso.speed_y
  perso.speed_x = perso.speed_x * 0.9
  perso.speed_y = perso.speed_y * 0.9
  if math.abs(perso.speed_x) < 0.1 then
    perso.speed_x = 0
  end
  if math.abs(perso.speed_y) < 0.1 then
    perso.speed_y = 0
  end
end

function love.draw()
  love.graphics.circle("fill", perso.x, perso.y, perso.r)
end

function love.keypressed(key)
  
end