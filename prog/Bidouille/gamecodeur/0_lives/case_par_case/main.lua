io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  nb_lignes = 10
  nb_colonnes = 10
  tuile_w = 25
  tuile_h = 25
  
  map = {}
  map[1] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  map[2] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}
  map[3] = {1, 0, 1, 0, 0, 0, 0, 0, 0, 1}
  map[4] = {1, 0, 1, 0, 0, 0, 0, 0, 0, 1}
  map[5] = {1, 0, 1, 1, 1, 1, 1, 0, 0, 1}
  map[6] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 1}
  map[7] = {1, 1, 1, 1, 1, 1, 1, 0, 0, 1}
  map[8] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}
  map[9] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}
  map[10] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  
  joueur = {}
  joueur.colonne = 2
  joueur.ligne = 2
  joueur.x = (joueur.colonne-1) * tuile_w
  joueur.y = (joueur.ligne-1) * tuile_h
  joueur.move_to_ligne = 2
  joueur.move_to_colonne = 2
  joueur.move = false
  joueur.vitesse = 130
end

function love.update(dt)
  if joueur.move == false then
    Repositionne_Joueur()
    if love.keyboard.isDown("up") then
      joueur.move_to_ligne = joueur.move_to_ligne - 1
      joueur.move = true
    elseif love.keyboard.isDown("right") then
      joueur.move_to_colonne = joueur.move_to_colonne + 1
      joueur.move = true
    elseif love.keyboard.isDown("down") then
      joueur.move_to_ligne = joueur.move_to_ligne + 1
      joueur.move = true
    elseif love.keyboard.isDown("left") then
      joueur.move_to_colonne = joueur.move_to_colonne - 1
      joueur.move = true
    end
  end
  
  local case = map[joueur.move_to_ligne][joueur.move_to_colonne]
  if case ~= 0 then
    joueur.move_to_ligne = joueur.ligne
    joueur.move_to_colonne = joueur.colonne
    joueur.move = false
  end
  
  if joueur.move == true then
    if joueur.move_to_colonne > joueur.colonne then
      joueur.x = joueur.x + joueur.vitesse*dt
      if math.floor(joueur.x/tuile_w)+1 >= joueur.move_to_colonne then
        joueur.colonne = joueur.move_to_colonne
        joueur.move = false
      end
    elseif joueur.move_to_colonne < joueur.colonne then
      joueur.x = joueur.x - joueur.vitesse*dt
      if math.ceil(joueur.x/tuile_w)+1 <= joueur.move_to_colonne then
        joueur.colonne = joueur.move_to_colonne
        joueur.move = false
      end
    elseif joueur.move_to_ligne > joueur.ligne then
      joueur.y = joueur.y + joueur.vitesse*dt
      if math.floor(joueur.y/tuile_h)+1 >= joueur.move_to_ligne then
        joueur.ligne = joueur.move_to_ligne
        joueur.move = false
      end
    elseif joueur.move_to_ligne < joueur.ligne then
      joueur.y = joueur.y - joueur.vitesse*dt
      if math.ceil(joueur.y/tuile_h)+1 <= joueur.move_to_ligne then
        joueur.ligne = joueur.move_to_ligne
        joueur.move = false
      end
    end
  end
end

function love.draw()
  for l=1,nb_lignes do
    for c=1,nb_colonnes do
      if map[l][c] == 1 then
        love.graphics.setColor(0.75, 0.75, 0.75)
        love.graphics.rectangle("fill", (c-1)*tuile_w, (l-1)*tuile_h, tuile_w, tuile_h)
        love.graphics.setColor(1, 1, 1)
      elseif map[l][c] == 0 then
        love.graphics.setColor(0.95, 0.85, 0.15)
        love.graphics.rectangle("fill", (c-1)*tuile_w, (l-1)*tuile_h, tuile_w, tuile_h)
        love.graphics.setColor(1, 1, 1)
      end
    end
  end
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", joueur.x, joueur.y, tuile_w, tuile_h)
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.print("x: "..tostring(joueur.x), 5, tuile_h*10)
  love.graphics.print("y: "..tostring(joueur.y), 5, (tuile_h*10)+16)
  love.graphics.print("colonne: "..tostring(joueur.colonne), 5, (tuile_h*10)+(16*2))
  love.graphics.print("ligne: "..tostring(joueur.ligne), 5, (tuile_h*10)+(16*3))
  love.graphics.print("colonne vers: "..tostring(joueur.move_to_colonne), 5, (tuile_h*10)+(16*4))
  love.graphics.print("ligne vers: "..tostring(joueur.move_to_ligne), 5, (tuile_h*10)+(16*5))
  love.graphics.print("etat move: "..tostring(joueur.move), 5, (tuile_h*10)+(16*6))
end

function love.keypressed(key)
  
end

function love.mousepressed(x, y, button)
  
end

function Repositionne_Joueur()
  joueur.x = (joueur.colonne-1) * tuile_w
  joueur.y = (joueur.ligne-1) * tuile_h
end