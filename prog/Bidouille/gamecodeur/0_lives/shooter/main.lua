io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  vaisseau = {}
  vaisseau.img = love.graphics.newImage("vaisseau_rouge.png")
  vaisseau.x = largeur/2 - vaisseau.img:getWidth()/2
  vaisseau.y = hauteur - vaisseau.img:getHeight()
  
  
  laser_img = love.graphics.newImage("laser_1.png")
  
  liste_tir = {}
  
  liste_etoile = {}
  for i=1,100 do
    etoile = {}
    etoile.x = love.math.random(1, largeur)
    etoile.y = love.math.random(1, hauteur)
    table.insert(liste_etoile, etoile)
  end
end

function love.update(dt)
  for i=1,#liste_etoile do
    liste_etoile[i].y = liste_etoile[i].y + 2
    if liste_etoile[i].y >= hauteur then
      liste_etoile[i].y = 0
    end
  end
  
  for i=#liste_tir, 1, -1 do
    liste_tir[i].y = liste_tir[i].y -4
    if liste_tir[i].y < 0 - laser_img:getHeight() then
      table.remove(liste_tir, i)
    end
  end
  
  if love.keyboard.isDown("right") then
    vaisseau.x = vaisseau.x + 5
  end
  if love.keyboard.isDown("left") then
    vaisseau.x = vaisseau.x - 5
  end
end

function love.draw()
  for i=1,#liste_etoile do
    love.graphics.points(liste_etoile[i].x, liste_etoile[i].y)
  end
  
  for i=1,#liste_tir do
    love.graphics.draw(laser_img, liste_tir[i].x, liste_tir[i].y)
  end
  
  love.graphics.draw(vaisseau.img, vaisseau.x, vaisseau.y)
  
  love.graphics.print("nombre tirs: "..tostring(#liste_tir))
end

function love.keypressed(key)
  if key == "space" then
    tir = {}
    tir.x = vaisseau.x + vaisseau.img:getWidth()/2 - 22
    tir.y = vaisseau.y
    table.insert(liste_tir, tir)
  end
end