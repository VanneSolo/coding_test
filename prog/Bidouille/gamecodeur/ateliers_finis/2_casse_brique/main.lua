largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
  
raquette = {}
raquette.x = 0
raquette.y = 0
raquette.largeur = 50
raquette.hauteur = 15
  
balle = {}
balle.x = 0
balle.y = 0
balle.rayon = 10
balle.vx = 0
balle.vy = 0
balle.colle = true
  
brique = {}
brique.largeur = largeur / 15
brique.hauteur = 15

niveau = {}

function Demarre()
  for l = 1,6 do
    niveau[l] = {}
    for c = 1,15 do
      niveau[l][c] = 1
    end
  end
end

function love.load()
  Demarre()
end

function love.update(dt)
  raquette.x = love.mouse.getX()
  
  if balle.colle == true then
    balle.x = raquette.x
    balle.y = hauteur - raquette.hauteur - balle.rayon
  else
    balle.x = balle.x + balle.vx * dt
    balle.y = balle.y - balle.vy * dt
    
    local c = math.floor((balle.x/brique.largeur)) + 1
    local l = math.floor((balle.y/brique.hauteur)) + 1
    if l > 0 and l <= #niveau and c >= 1 and c <= 15 then
      if niveau[l][c] == 1 then
        niveau[l][c] = 0
        balle.vy = 0 - balle.vy
      end
    end
  
    if balle.x > largeur then
      balle.vx = 0 - balle.vx
      balle.x = largeur
    end
    
    if balle.x < 0 then
      balle.vx = 0 - balle.vx
      balle.x = 0
    end
    
    if balle.y < 0 then
      balle.vy = 0 - balle.vy
      balle.y = 0
    end
    
    if balle.y > hauteur then
      balle.colle = true
    end
    
    positionBalle = hauteur - (raquette.hauteur/2) - balle.rayon
    if balle.y > positionBalle then
      compareBalleX_RaquetteLargeur = math.abs(raquette.x - balle.x)
      if compareBalleX_RaquetteLargeur < raquette.largeur/2 then
        balle.vy = 0 - balle.vy
        balle.y = positionBalle
      end
    end
  end
end

function love.draw()
  briqueL = 0
  briqueH = 0
  
  for l = 1,6 do
    briqueL = 0
    for c = 1,15 do
      if niveau[l][c] == 1 then
        love.graphics.rectangle("fill", briqueL, briqueH+1, brique.largeur-1, brique.hauteur-1)
      end
      briqueL = briqueL + brique.largeur
    end
    briqueH = briqueH + brique.hauteur
  end
  
  love.graphics.rectangle("fill", raquette.x - (raquette.largeur/2), hauteur - raquette.hauteur, raquette.largeur, raquette.hauteur)
  love.graphics.circle("fill", balle.x, balle.y, balle.rayon)
end

function love.mousepressed(x, y, n)
  if balle.colle == true then
    balle.colle = false
    balle.vx = 200
    balle.vy = 200
  end
end