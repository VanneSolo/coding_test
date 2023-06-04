io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  est_allume = false
  
  joueur = {}
  joueur.x = 100
  joueur.y = 300
  joueur.w = 20
  joueur.h = 20
  
  sol = {}
  sol.x1 = 0
  sol.y1 = 550
  sol.x2 = largeur
  sol.y2 = 550
end

function love.update(dt)
  est_allume = false
  if love.keyboard.isDown("up") then
    est_allume = true
    joueur.y = joueur.y - 5
  end
  if love.keyboard.isDown("right") then
    joueur.x = joueur.x + 5
  end
  if love.keyboard.isDown("left") then
    joueur.x = joueur.x - 5
  end
  if joueur.y+joueur.h <= sol.y1 then
    joueur.y = joueur.y + 2
  end
end

function love.draw()
  love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.w, joueur.h)
  if est_allume then
    love.graphics.setColor(1, 0, 0)
    love.graphics.polygon("fill", joueur.x+2, joueur.y+joueur.h, joueur.x+joueur.w-2, joueur.y+joueur.h, joueur.x+(joueur.w/2), joueur.y+joueur.h+10)
    love.graphics.setColor(1, 1, 1)
  end
  
  love.graphics.line(sol.x1, sol.y1, sol.x2, sol.y2)
end