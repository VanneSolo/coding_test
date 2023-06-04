require "loadimage"

hero = {}
hero.frames = {}
hero.frame = 1
hero.sheet = love.graphics.newImage("v2_green_roger_spritesheet.png")
hero.x = 10
hero.y = 15
hero.rotation = 0
hero.scale_x = 2
hero.scale_y = 2

loadImages("v2_green_roger_spritesheet.png", 8, 14, 32, hero)

function updateHero()
  if love.keyboard.isDown("up") then
    hero.y = hero.y - 5
    hero.scale_x = 2
  end
  if love.keyboard.isDown("right") then
    hero.x = hero.x + 5
    hero.scale_x = 2
  end
  if love.keyboard.isDown("down") then
    hero.y = hero.y + 5
    hero.scale_x = 2
  end
  if love.keyboard.isDown("left") then
    hero.x = hero.x - 5
    hero.scale_x = -2
  end
end