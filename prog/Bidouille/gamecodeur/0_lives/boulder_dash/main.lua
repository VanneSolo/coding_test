io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  fps = 0
  nb_diamants = 0
  
  id_vide = 0
  id_terre = 1
  id_boulder = 2
  id_boulder_chute = 3
  id_rockford = 4
  id_diamant = 5
  
  grille = {}
  nb_lignes = 30
  nb_colonnes = 40
  for l=1,nb_lignes do
    grille[l] = {}
    for c=1,nb_colonnes do
      local de = love.math.random(0, 100)
      if de < 2 then
        grille[l][c] = id_diamant
        nb_diamants = nb_diamants + 1
      elseif de < 50 then
        grille[l][c] = id_vide
      elseif de < 90 then
        grille[l][c] = id_terre
      else
        grille[l][c] = id_boulder
      end
    end
    grille[1][1] = id_rockford
  end
end

function love.update(dt)
  fps = fps + 1
  if fps == 6 then
    Update_Game()
    fps = 0
  end
end

function love.draw()
  for l=1,nb_lignes do
    for c=1,nb_colonnes do
      local id = Get_ID(l, c)
      if id == id_vide then
        love.graphics.setColor(0, 0, 0)
      elseif id == id_terre then
        love.graphics.setColor(0.72, 0.08, 0.19)
      elseif id == id_boulder or id == id_boulder_chute then
        love.graphics.setColor(0.5, 0.5, 0.5)
      elseif id == id_rockford then
        love.graphics.setColor(0, 1, 0)
      elseif id == id_diamant then
        love.graphics.setColor(0, 0, 1)
      end
      love.graphics.rectangle("fill", (c-1)*15, (l-1)*15, 15, 15)
    end
  end
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.print("diamants restants: "..tostring(nb_diamants), 10, 550)
end

function love.keypressed(key)
  
end

function Get_ID(pLigne, pColonne)
  if pLigne >= 1 and pLigne <= nb_lignes and pColonne >= 1 and pColonne <= nb_colonnes then
    return grille[pLigne][pColonne]
  else
    return -1
  end
end

function Move_ID(pFrom_Ligne, pFrom_Colonne, pTo_Ligne, pTo_Colonne, pID)
  grille[pTo_Ligne][pTo_Colonne] = pID
  grille[pFrom_Ligne][pFrom_Colonne] = id_vide
end

function Update_Game()
  local scan_rockford = false
  for l=nb_lignes,1,-1 do
    for c=nb_colonnes,1,-1 do
      local id = Get_ID(l, c)
      if id == id_boulder then
        local id_under = Get_ID(l+1, c)
        if id_under == id_vide then
          grille[l][c] = id_boulder_chute
        elseif Is_Round(id_under) then
          local id_left = Get_ID(l, c-1)
          local id_left_under = Get_ID(l+1, c-1)
          local id_right = Get_ID(l, c+1)
          local id_right_under = Get_ID(l+1, c+1)
          if id_left == id_vide and id_left_under == id_vide then
            Move_ID(l, c, l, c-1, id_boulder)
          elseif id_right == id_vide and id_right_under == id_vide then
            Move_ID(l, c, l, c+1, id_boulder)
          end
        end  
      elseif id == id_boulder_chute then
        local id_under = Get_ID(l+1, c)
        if id_under == id_vide then
          Move_ID(l, c, l+1, c, id)
        elseif Is_Round(id_under) then
          local id_left = Get_ID(l, c-1)
          local id_left_under = Get_ID(l+1, c-1)
          local id_right = Get_ID(l, c+1)
          local id_right_under = Get_ID(l+1, c+1)
          if id_left == id_vide and id_left_under == id_vide then
            Move_ID(l, c, l, c-1, id_boulder)
          elseif id_right == id_vide and id_right_under == id_vide then
            Move_ID(l, c, l, c+1, id_boulder)
          end
        else
          grille[l][c] = id_boulder
        end
      elseif id == id_rockford and scan_rockford == false then
        scan_rockford = true
        local new_ligne, new_colonne = l, c
        local dir
        if love.keyboard.isDown("up") then
          new_ligne = new_ligne - 1
        end
        if love.keyboard.isDown("right") then
          new_colonne = new_colonne + 1
          dir = "RIGHT"
        end
        if love.keyboard.isDown("down") then
          new_ligne = new_ligne + 1
        end
        if love.keyboard.isDown("left") then
          new_colonne = new_colonne - 1
          dir = "LEFT"
        end
        local id_to = Get_ID(new_ligne, new_colonne)
        if id_to == id_terre or id_to == id_vide then
          Move_ID(l, c, new_ligne, new_colonne, id)
        elseif id_to == id_diamant then
          nb_diamants = nb_diamants - 1
          Move_ID(l, c, new_ligne, new_colonne, id)
        elseif id_to == id_boulder then
          if dir == "LEFT" then
            local id_left = Get_ID(l, new_colonne-1)
            if id_left == id_vide and love.math.random(1, 8) == 8 then
              Move_ID(new_ligne, new_colonne, new_ligne, new_colonne-1, id_boulder)
              Move_ID(l, c, new_ligne, new_colonne, id_rockford)
            end
          elseif dir == "RIGHT" then
            local id_right = Get_ID(l, new_colonne+1)
            if id_right == id_vide and love.math.random(1, 8) == 8 then
              Move_ID(new_ligne, new_colonne, new_ligne, new_colonne+1, id_boulder)
              Move_ID(l, c, new_ligne, new_colonne, id_rockford)
            end  
          end
        end
      end
    end
  end
end

function Is_Round(pID)
  if pID == id_boulder or pID == id_boulder_chute or pID == id_diamant then
    return true
  else
    return false
  end
end