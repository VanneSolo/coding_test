function love.load()
  grille = {}
  grille_largeur = 0
  grille_hauteur = 0
  
  taille_cellule = 0
  
  pause = true
  
  Nouveau(160, 120)
  Random_Game()
end

function love.update(dt)
  if pause == false then
    Life()
  end
  
  if love.mouse.isDown(1) then
    local c = math.floor(love.mouse.getX()/taille_cellule + 1)
    local l = math.floor(love.mouse.getY()/taille_cellule + 1)
    if l>=1 and c>=1 and l<=grille_hauteur and c<=grille_largeur then
      grille[l][c] = 1
    end
  end
end

function love.draw()
  for l=1,grille_hauteur do
    for c=1,grille_largeur do
      if grille[l][c] == 1 then
        love.graphics.rectangle("fill", (c-1)*taille_cellule, (l-1)*taille_cellule, taille_cellule, taille_cellule)
      end
    end
  end
end

function Nouveau(largeur, hauteur)
  grille_largeur = largeur
  grille_hauteur = hauteur
  
  for l=1,grille_hauteur do
    grille[l] = {}
    for c=1,grille_largeur do
      grille[l][c] = 0
    end
  end
  
  taille_largeur = love.graphics.getWidth() / grille_largeur
  taille_hauteur = love.graphics.getHeight() / grille_hauteur
  if taille_largeur*grille_hauteur > love.graphics.getHeight() then
    taille_cellule = taille_hauteur
  else
    taille_cellule = taille_largeur
  end
end

function Random_Game()
  for l=1,grille_hauteur do
    for c=1,grille_largeur do
      if love.math.random(1, 10) == 1 then
        grille[l][c] = 1
      end
    end
  end
end

function Life()
  local nouvelle_grille = {}
  
  for l=1,grille_hauteur do
    nouvelle_grille[l] = {}
    for c=1,grille_largeur do
      local v = Calcul_Voisin(l, c)
      if v == 2 then
        nouvelle_grille[l][c] = grille[l][c]
      elseif v == 3 then
        nouvelle_grille[l][c] = 1
      else
        nouvelle_grille[l][c] = 0
      end
    end
  end
  
  grille = nouvelle_grille
end

function Calcul_Voisin(pLine, pColl)
  local nb_voisins = 0
  
  nb_voisins = nb_voisins + Verifie_Indice(pLine-1, pColl-1)
  nb_voisins = nb_voisins + Verifie_Indice(pLine-1, pColl)
  nb_voisins = nb_voisins + Verifie_Indice(pLine-1, pColl+1)
  
  nb_voisins = nb_voisins + Verifie_Indice(pLine, pColl-1)
  nb_voisins = nb_voisins + Verifie_Indice(pLine, pColl+1)
  
  nb_voisins = nb_voisins + Verifie_Indice(pLine+1, pColl-1)
  nb_voisins = nb_voisins + Verifie_Indice(pLine+1, pColl)
  nb_voisins = nb_voisins + Verifie_Indice(pLine+1, pColl+1)
  
  return nb_voisins
end

function Verifie_Indice(pLine, pColl)
  if pLine>=1 and pColl>=1 and pLine<=grille_hauteur and pColl<=grille_largeur then
    return grille[pLine][pColl]
  else
    return 0
  end
end

function love.keypressed(key)
  if key == "space" then
    pause = not pause
  end
  if key == "right" and pause==true then
    Life()
  end
end