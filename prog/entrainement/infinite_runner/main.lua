io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = 0
hauteur = 0

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  sol = {}
  sol.w = largeur
  sol.h = 100
  sol.x = 0
  sol.x2 = largeur
  sol.y = hauteur-sol.h
  sol.img = love.graphics.newCanvas(800, 100)
  
  love.graphics.setCanvas(sol.img)
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 100, sol.h)
  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle("fill", 100, 0, 100, sol.h)
  love.graphics.setColor(1, 0, 1)
  love.graphics.rectangle("fill", 200, 0, 100, sol.h)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 300, 0, 100, sol.h)
  love.graphics.setColor(0, 1, 1)
  love.graphics.rectangle("fill", 400, 0, 100, sol.h)
  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle("fill", 500, 0, 100, sol.h)
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", 600, 0, 100, sol.h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 700, 0, 100, sol.h)
  love.graphics.setCanvas()
  
  immeuble = {}
  immeuble.w = 80
  immeuble.h = 250
  immeuble.x = 150
  immeuble.y = sol.y - immeuble.h
  immeuble.img = love.graphics.newCanvas(immeuble.w, immeuble.h)
  
  love.graphics.setCanvas(immeuble.img)
  love.graphics.rectangle("fill", 0, 0, immeuble.w, immeuble.h)
  love.graphics.setCanvas()
  
  fond = {}
  fond.w = largeur
  fond.h = 300
  fond.x = 0
  fond.x2 = largeur
  fond.y = sol.y - fond.h
  fond.img = love.graphics.newCanvas(fond.w, fond.h)
  
  love.graphics.setCanvas(fond.img)
  love.graphics.setColor(0.3, 0.3, 0.3)
  love.graphics.rectangle("fill", 0, 250, fond.w, 50)
  love.graphics.rectangle("fill", 10, fond.h-100, 20, 50)
  love.graphics.rectangle("fill", 50, fond.h-130, 35, 80)
  love.graphics.rectangle("fill", 100, fond.h-125, 25, 75)
  love.graphics.rectangle("fill", 150, fond.h-100, 20, 50)
  love.graphics.rectangle("fill", 200, fond.h-200, 40, 150)
  love.graphics.rectangle("fill", 250, fond.h-130, 30, 80)
  love.graphics.rectangle("fill", 300, fond.h-90, 35, 40)
  love.graphics.rectangle("fill", 350, 250, fond.w, 50)
  love.graphics.rectangle("fill", 400, fond.h-100, 20, 50)
  love.graphics.rectangle("fill", 450, fond.h-130, 35, 80)
  love.graphics.rectangle("fill", 500, fond.h-125, 25, 75)
  love.graphics.rectangle("fill", 550, fond.h-100, 20, 50)
  love.graphics.rectangle("fill", 600, fond.h-200, 40, 150)
  love.graphics.rectangle("fill", 650, fond.h-130, 30, 80)
  love.graphics.rectangle("fill", 700, fond.h-90, 35, 40)  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

function love.update(dt)
  sol.x = sol.x-2
  if sol.x+sol.w <= 0 then
    sol.x = largeur
  end
  sol.x2 = sol.x2 - 2
  if sol.x2+sol.w <= 0 then
    sol.x2 = largeur
  end
  
  immeuble.x = immeuble.x-2
  if immeuble.x+immeuble.w <= 0 then
    immeuble.x = largeur+150
  end
  
  fond.x = fond.x-5
  if fond.x+fond.w <= 0 then
    fond.x = largeur
  end
  fond.x2 = fond.x2-5
  if fond.x2+fond.w <= 0 then
    fond.x2 = largeur
  end
end

function love.draw()
  love.graphics.draw(fond.img, fond.x, fond.y)
  love.graphics.draw(fond.img, fond.x2, fond.y)
  
  love.graphics.draw(sol.img, sol.x, sol.y)
  love.graphics.draw(sol.img, sol.x2, sol.y)
  love.graphics.draw(immeuble.img, immeuble.x, immeuble.y)
end

function love.mousepressed(x, y, buton)
  
end

function love.keypressed(key)
  
end