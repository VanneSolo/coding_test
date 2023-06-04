--require "grille"

balle = {}
balle.x = 0
balle.y = 0
balle.rayon = 10
balle.vx = 0
balle.vy = 0
balle.colle = true

function UpdateBalle(dt)
  if balle.colle == true then
    balle.x = raquette.x
    balle.y = hauteur - raquette.hauteur - balle.rayon
  else
    balle.x = balle.x + balle.vx * dt
    balle.y = balle.y - balle.vy * dt
    
    local c = math.floor((balle.x/brique.largeur)) + 1
    local l = math.floor((balle.y/brique.hauteur)) + 1
    if l > 0 and l <= #niveau and c >= 1 and c <= nombreColonnes then
      if niveau[l][c] == 1 then
        niveau[l][c] = 0
        balle.vy = 0 - balle.vy
      end
    end
  
    if balle.x >= largeur then
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
  
  function DrawBalle()
    love.graphics.circle("fill", balle.x, balle.y, balle.rayon)
  end
  
  function IsGlued()
    if balle.colle == true then
      balle.colle = false
      balle.vx = 200
      balle.vy = 200
    end
  end
end