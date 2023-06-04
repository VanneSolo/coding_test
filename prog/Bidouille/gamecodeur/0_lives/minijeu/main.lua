io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  bateau = {}
  bateau.img = love.graphics.newImage("bateau.png")
  bateau.w = bateau.img:getWidth()
  bateau.h = bateau.img:getHeight()
  bateau.x = largeur
  bateau.y = 10
  
  cible = {}
  cible.img = love.graphics.newImage("cible.png")
  cible.w = cible.img:getWidth()
  cible.h = cible.img:getHeight()
  cible.x = largeur/2
  cible.y = (bateau.y+bateau.h) - (cible.h/2)
  
  torpille = {}
  torpille.img = love.graphics.newImage("torpille.png")
  torpille.w = torpille.img:getWidth()
  torpille.h = torpille.img:getHeight()
  torpille.x = 0
  torpille.y = hauteur
  can_shoot = false
  score = 0
end

function love.update(dt)
  bateau.x = bateau.x - 1
  if bateau.x+bateau.w <= 0 then
    bateau.x = largeur
  end
  
  souris_x, souris_y = love.mouse.getPosition()
  cible.x = souris_x - (cible.w/2)
  
  if can_shoot == true then
    torpille.y = torpille.y - 2
    if torpille.x < bateau.x+bateau.w and bateau.x < torpille.x+torpille.w and torpille.y < bateau.y+bateau.h and bateau.y < torpille.y+torpille.h then
      score = score + 300
      bateau.x = -bateau.w
    end
  end
  if torpille.y+torpille.h < 0 then
    can_shoot = false
  end
end

function love.draw()
  love.graphics.draw(bateau.img, bateau.x, bateau.y, 0, 1, 1)
  love.graphics.setColor(0, 0, 1)
  love.graphics.line(0, bateau.y+bateau.h, largeur, bateau.y+bateau.h)
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.draw(cible.img, cible.x, cible.y)
  love.graphics.draw(torpille.img, torpille.x, torpille.y)
  
  love.graphics.print("SCORE: "..tostring(score), 10, 10)
  
end

function love.keypressed(key)
  
end

function love.mousepressed(x, y, button)
  if button == 1 then
    can_shoot = true
    torpille.x = (cible.x + (cible.w/2)) - (torpille.w/2)
    torpille.y = hauteur
  end
end