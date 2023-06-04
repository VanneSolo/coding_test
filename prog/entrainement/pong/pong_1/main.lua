io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

joueur = {}
joueur.w = 10
joueur.h = 50
joueur.x = largeur-30
joueur.y = hauteur/2-joueur.h/2
joueur.speed = 0

ennemi = {}
ennemi.w = 10
ennemi.h = 50
ennemi.x = 20
ennemi.y = hauteur/2-ennemi.h/2
ennemi.speed_y = 0

balle = {}
balle.w = 15
balle.h = 15
balle.x = largeur/2-balle.w/2
balle.y = 0
balle.speed_x = 2
balle.speed_y = 2

point_ia = 0
point_joueur = 0

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.load()
  
end

function love.update(dt)
  if love.keyboard.isDown("up") then
    joueur.y = joueur.y - 2
  end
  if love.keyboard.isDown("down") then
    joueur.y = joueur.y + 2
  end
  
  if joueur.y <= 0 then
    joueur.y = 0
  end
  if joueur.y >= hauteur-joueur.h then
    joueur.y = hauteur-joueur.h
  end
  
  if balle.x >= largeur then
    point_ia = point_ia + 1
    print("point ia", point_ia)
    balle.x = largeur/2
    balle.y = 2
  elseif balle.x+balle.w <= 0 then
    point_joueur = point_joueur + 1
    print("point joueur", point_joueur)
    balle.x = largeur/2
    balle.y = 2
  end
  balle.x = balle.x + balle.speed_x
  balle.y = balle.y + balle.speed_y
  
  if balle.y >= hauteur-balle.h or balle.y <= 0 then
    balle.speed_y = -balle.speed_y
  end
  
  contact = CheckCollision(joueur.x, joueur.y, joueur.w, joueur.h, balle.x, balle.y, balle.w, balle.h)
  if contact then
    if balle.speed_y < 0 and balle.x+balle.w/2 > joueur.x then
      balle.y = joueur.y+joueur.h
      balle.speed_y = -balle.speed_y
    elseif balle.speed_y > 0 and balle.x+balle.w/2 > joueur.x then
      balle.y = joueur.y-balle.h
      balle.speed_y = -balle.speed_y
    else
      balle.x = joueur.x-balle.w
      balle.speed_x = -balle.speed_x
    end
  end
  
  hasard = love.math.random(1, 5)
  if balle.y+balle.h/2 < ennemi.y and hasard == 1 then
    ennemi.speed_y = -2
  end
  if balle.y+balle.h/2 > ennemi.y+ennemi.h and hasard == 2 then
    ennemi.speed_y = 2
  end
  
  ennemi.y = ennemi.y + ennemi.speed_y
  
  if ennemi.y >= hauteur-ennemi.h then
    ennemi.y = hauteur-ennemi.h
  end
  if ennemi.y <= 0 then
    ennemi.y = 0
  end
  
  contact_2 = CheckCollision(ennemi.x, ennemi.y, ennemi.w, ennemi.h, balle.x, balle.y, balle.w, balle.h)
  if contact_2 then
    if balle.speed_y < 0 and balle.x+balle.w/2 < ennemi.x+ennemi.w then
      balle.y = ennemi.y+ennemi.h
      balle.speed_y = -balle.speed_y
    elseif balle.speed_y > 0 and balle.x+balle.w/2 < ennemi.x+ennemi.w then
      balle.y = ennemi.y-balle.h
      balle.speed_y = -balle.speed_y
    else
      balle.x = ennemi.x+ennemi.w
      balle.speed_x = -balle.speed_x
    end
  end
end

function love.draw()
  love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.w, joueur.h)
  love.graphics.rectangle("fill", ennemi.x, ennemi.y, ennemi.w, ennemi.h)
  
  love.graphics.rectangle("fill", balle.x, balle.y, balle.w, balle.h)
end