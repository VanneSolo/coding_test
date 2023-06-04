io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  screen_w = love.graphics.getWidth()
  screen_h = love.graphics.getHeight()
  
  star = {}
  star.img = love.graphics.newImage("star.png")
  star.x = screen_w / 2
  star.y = screen_h / 2
  star.rotation = 0
  star.ox = star.img:getWidth() / 2
  star.oy = star.img:getHeight() / 2
  
  planet = {}
  planet.img = love.graphics.newImage("planet.png")
  planet.angle = 0
  planet.rayon = 100
  planet.x = star.x + planet.rayon * math.cos(planet.angle)
  planet.y = star.y + planet.rayon * math.sin(planet.angle)
  planet.rotation = 0
  planet.ox = planet.img:getWidth() / 2
  planet.oy = planet.img:getHeight() / 2
end

function love.update(dt)
  planet.angle = planet.angle + math.pi * dt
 
  planet.x = star.x + planet.rayon * math.cos(planet.angle)
  planet.y = star.y + planet.rayon * math.sin(planet.angle)
  
  star.rotation = star.rotation + 0.1
  planet.rotation = planet.rotation - 0.1
end

function love.draw()
  love.graphics.draw(star.img, star.x, star.y, star.rotation, 1, 1, star.ox, star.oy)
  love.graphics.draw(planet.img, planet.x, planet.y, planet.rotation, 1, 1, planet.ox, planet.oy)
end