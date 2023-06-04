io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

hero = {}
hero.frames = {}
hero.frame = 1
hero.sheet = 0
hero.x = 10
hero.y = 15

function love.load()
  hero.sheet = love.graphics.newImage("v2_green_roger_spritesheet.png")
  
  hero.frames[1] = love.graphics.newQuad(0, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[2] = love.graphics.newQuad(14, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[3] = love.graphics.newQuad(28, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[4] = love.graphics.newQuad(42, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[5] = love.graphics.newQuad(56, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[6] = love.graphics.newQuad(70, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[7] = love.graphics.newQuad(84, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
  hero.frames[8] = love.graphics.newQuad(98, 0, 14, 32, hero.sheet:getWidth(), hero.sheet:getHeight())
end

function love.update(dt)
  hero.frame = hero.frame + 10*dt
  if hero.frame >= #hero.frames + 1 then
    hero.frame = 1
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
  
  local frameArrondie = math.floor(hero.frame)
  
  love.graphics.draw(hero.sheet, hero.frames[frameArrondie], hero.x, hero.y, 0, 2, 2)
end