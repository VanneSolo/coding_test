io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  flocon_img = love.graphics.newImage("diamond.png")
  
  soleil = {}
  soleil.img = love.graphics.newImage("star_2.png")
  soleil.w = soleil.img:getWidth()
  soleil.h = soleil.img:getHeight()
  soleil.x = 0
  soleil.y = 0
  soleil.ox = soleil.w/2
  soleil.oy = soleil.h/2
  soleil.angle = 0
  soleil.decalage = 200
  
  lune = {}
  lune.img = love.graphics.newImage("coin.png")
  lune.w = soleil.img:getWidth()
  lune.h = soleil.img:getHeight()
  lune.x = 0
  lune.y = 0
  lune.ox = lune.w/2
  lune.oy = lune.h/2
  lune.angle = soleil.angle
  lune.decalage = soleil.decalage
  
  angle_flocon = 0
  x_flocon = 100
  y_flocon = 0
end

function love.update(dt)
  soleil.angle = soleil.angle + 0.01
  soleil.x = soleil.decalage * math.cos(soleil.angle)
  soleil.y = soleil.decalage * math.sin(soleil.angle)
  
  lune.x = soleil.decalage * math.cos(soleil.angle + math.pi)
  lune.y = soleil.decalage * math.sin(soleil.angle + math.pi)
  
  angle_flocon = angle_flocon + 0.1
  y_flocon = y_flocon + 2
  x_flocon = 100
  x_flocon = x_flocon + (20 * math.sin(angle_flocon))
end

function love.draw()
  love.graphics.push()
  love.graphics.setScissor(149, 49, largeur-298, hauteur/2-48)
  love.graphics.draw(soleil.img, soleil.x + (largeur/2), soleil.y + (hauteur/2), 0, 1, 1, soleil.ox, soleil.oy)
  love.graphics.draw(lune.img, lune.x + (largeur/2), lune.y + (hauteur/2), 0, 1, 1, lune.ox, lune.oy)
  
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("line", 150, 50, largeur-300, hauteur/2-50)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", largeur/2, hauteur/2, 2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setScissor()
  love.graphics.pop()
  
  love.graphics.draw(soleil.img, largeur/2, 450)
  love.graphics.draw(flocon_img, x_flocon, y_flocon)
end