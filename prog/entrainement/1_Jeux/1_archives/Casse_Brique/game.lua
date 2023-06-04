local Game = {}

function Game.Init()
  -- Paramètres du joueur.
  joueur = {}
  joueur.w = 50
  joueur.h = 10
  joueur.x = largeur/2 - joueur.w/2
  joueur.y = hauteur - 20
  joueur.vx = 0
  joueur.s = 10
  joueur.pv = 10
  
  -- Paramètres de la balle.
  balle = {}
  balle.w = 10
  balle.h = 10
  balle.x = joueur.x+joueur.w/2-balle.w/2
  balle.y = joueur.y-balle.h
  balle.on_pad = true
  balle.vx = 0
  balle.vy = 0
  
  -- Paramètres de la grille de tuiles.
  tuile_w = 50
  tuile_h = 24
  nb_col = largeur/tuile_w
  nb_lig = 6
  nb_tuiles = nb_col*nb_lig
  
  -- Chargement de la grille de tuiles.
  grid = {}
  for l=1, nb_lig do
    grid[l] = {}
    for c=1,nb_col do
      grid[l][c] = 1
    end
  end
end

function Game.Update(dt)
  -- Détection du survol des cases de la grille par la souris.
  on_case = false
  mouse_x, mouse_y = love.mouse.getPosition()
  col_x = math.floor(mouse_x/tuile_w) + 1
  col_y = math.floor(mouse_y/tuile_h) + 1
  if grid[col_y] ~= nil then
    if grid[col_y][col_x] == 1 then
      on_case = true
    end
  end
  
  -- Maj de la position du joueur.
  if love.keyboard.isDown("right") then
    joueur.vx = joueur.vx + joueur.s
  end
  if love.keyboard.isDown("left") then
    joueur.vx = joueur.vx - joueur.s
  end
  joueur.x = joueur.x + joueur.vx*dt
  joueur.vx = joueur.vx*0.98
  if joueur.vx >= -5 and joueur.vx <= 5 then
    joueur.vx = 0
  end
  -- Arrêt du joueur s'il sort des limites de l'écran.
  if joueur.x+joueur.w >= largeur then
    joueur.x = largeur-joueur.w
    joueur.vx = 0
  elseif joueur.x <= 0 then
    joueur.x = 0
    joueur.vx = 0
  end
  
  -- Maj de la position de la balle
  if balle.on_pad then
    balle.x = joueur.x+joueur.w/2-balle.w/2
    balle.y = joueur.y-balle.h
  else
    -- Si la balle touche les bords gauche ou droit, on inverse sa vitesse x, si elle touche
    -- le bord haut on inverse sa vitesse y.
    if balle.x+balle.w > largeur then
      balle.x = largeur-balle.w
      balle.vx = -balle.vx
    elseif balle.x < 0 then
      balle.x = 0
      balle.vx = -balle.vx
    elseif balle.y+balle.h < 0 then
      balle.y = 0
      balle.vy = -balle.vy
    -- Si elle sort par le bas de l'écran on la replace
    -- sur la raquette et on enlève un pv au joueur.
    elseif balle.y > hauteur then
      joueur.pv = joueur.pv-1
      balle.on_pad = true
    end
    -- Si la balle touche la raquette on inverse la vitesse y.
    if balle.x > joueur.x and balle.x+balle.w < joueur.x+joueur.w and balle.y+balle.h > joueur.y then
      balle.y = joueur.y-balle.h
      balle.vy = -balle.vy
    end
    -- Gestion de la collision entre la balle et les tuiles et du nombre de tuiles affichées à l'écran.
    balle_col_x = math.floor(balle.x/tuile_w) + 1
    balle_col_y = math.floor(balle.y/tuile_h) + 1
    balle.x = balle.x + balle.vx*dt
    balle.y = balle.y + balle.vy*dt
    if grid[balle_col_y] ~= nil then
      if grid[balle_col_y][balle_col_x] == 1 then
        grid[balle_col_y][balle_col_x] = 0
        balle.vy = -balle.vy
        nb_tuiles = nb_tuiles-1
      end
    end
  end
  if joueur.pv <= 0 then
    current_scene = "DEFAITE"
    joueur.pv = 10
    nb_tuiles = nb_col*nb_lig
  end
  if nb_tuiles <= 0 then
    current_scene = "VICTOIRE"
    joueur.pv = 10
    nb_tuiles = nb_col*nb_lig
  end
end

function Game.Draw()
  -- Affichage du joueur.
  love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.w, joueur.h)
  -- Affichage de la grille de tuiles.
  love.graphics.setColor(0.5, 0.5, 1)
  for l=1,nb_lig do
    for c=1,nb_col do
      if grid[l][c] == 1 then
        love.graphics.rectangle("fill", (c-1)*tuile_w, ((l-1)*tuile_h)+4, tuile_w-4, tuile_h-4)
        -- Affichage d'une case en jaune si elle est survolée par la souris.
        if on_case then
          love.graphics.setColor(1, 1, 0)
          love.graphics.rectangle("fill", (col_x-1)*tuile_w, (col_y-1)*tuile_h+4, tuile_w-4, tuile_h-4)
          love.graphics.setColor(0.5, 0.5, 1)
        end
      end
    end
  end
  
  -- Affichage de la balle.
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", balle.x, balle.y, balle.w, balle.h)
  love.graphics.setColor(1, 1, 1)
  
  -- Affichages de quelques informations.
  love.graphics.setColor(1, 0, 0)
  love.graphics.print("JEU", 5, 5)
  --love.graphics.print("joueur.vx: "..tostring(joueur.vx), 5, 5+16)
  --love.graphics.print("nb_col: "..tostring(nb_col), 5, 5+16*2)
  --love.graphics.print("balle.vx: "..tostring(balle.vx), 5, 5+16*3)
  --love.graphics.print("mouse_x: "..tostring(mouse_x)..", mouse_y: "..tostring(mouse_y), 5, 5+16*4)
  --love.graphics.print(tostring(col_x)..", "..tostring(col_y), (col_x-1)*tuile_w, (col_y-1)*tuile_h)
  --love.graphics.print("on_case: "..tostring(on_case), 5, 5+16*5)
  love.graphics.print("joueur.pv: "..tostring(joueur.pv), 5, 5+16*6)
  love.graphics.print("nombre tuiles: "..tostring(nb_tuiles), 5, 5+16*7)
  
  love.graphics.setColor(1, 1, 1)
end

function Game.Keypressed(key)
  
end

function Game.Mousepressed(x, y, button)
  if button == 1 then
    balle.on_pad = false
    balle.vx = 150
    balle.vy = -150
  end
end

return Game