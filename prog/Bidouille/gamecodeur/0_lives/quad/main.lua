io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  hero = {}
  hero.img = love.graphics.newImage("v2_green_roger_spritesheet.png")
  hero.w = hero.img:getWidth()
  hero.qw = hero.w/8
  hero.h = hero.img:getHeight()
  hero.x = 50
  hero.y = hauteur/2
  
  timer_frame = 0
  frame = 1
  
  quad = {}
  for i=1,8 do
    local x = (i-1) * 14
    quad[i] = love.graphics.newQuad(x, 0, hero.qw, hero.h, hero.w, hero.h)
  end
end

function love.update(dt)
  timer_frame = timer_frame + dt
  if timer_frame > 0.1 then
    timer_frame = 0
    frame = frame + 1
    if frame > 8 then
      frame = 1
    end
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0.5 , 0.5)
  for i=1,#quad do
    love.graphics.draw(hero.img, quad[frame], hero.x, hero.y)
  end
end