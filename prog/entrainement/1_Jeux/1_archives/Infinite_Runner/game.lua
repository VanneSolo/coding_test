local Pause = require("pause")

-- Création du tank
tank = {}
tank.img = love.graphics.newCanvas(100, 75)
tank.w = tank.img:getWidth()
tank.h = tank.img:getHeight()
tank.x = 325
tank.y = 335
local function Create_Tank()
  love.graphics.setCanvas(tank.img)
  love.graphics.setColor(0.17, 0.77, 0.35)
  love.graphics.rectangle("fill", 0, 55, tank.w, 20)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end
-- Et des roues du tank.
roue = {}
roue.img = love.graphics.newCanvas(20, 20)
roue.w = roue.img:getWidth()
roue.h = roue.img:getHeight()
roue.r = 0
local function Create_Roue()
  love.graphics.setCanvas(roue.img)
  love.graphics.setColor(0.17, 0.77, 0.35)
  love.graphics.circle("fill", roue.w/2, roue.h/2, roue.w/2)
  love.graphics.setColor(0, 0, 0)
  love.graphics.line(roue.w/2, roue.w/2, roue.w, roue.w/2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

-- Fonction qui permet de créer les colonnes.
local function Create_Col(pW, pY, pX)
  local col = {}
  col.w = pW
  col.h = -love.math.random(50, 150)
  col.x = pX
  col.y = pY
  col.r = love.math.random()
  col.g = love.math.random()
  col.b = love.math.random()
  col.grey_scale = love.math.random()
  table.insert(lst_col, col)
end

local Game = {}

function Game.Init()
  -- Dimensions de la zone de jeu. les coordonnées du bord haut sont codées en dur. Les coordonnées 
  -- des trois autres côtés sont indéxées dessus, sauf le y2 du côté droit, lui aussi codé en dur.
  screen = {}
  screen.top = {x1=200, y1=150, x2=600, y2=150}
  --screen.top = {x1=83, y1=72, x2=532, y2=72}
  --screen.top = {x1=0, y1=0, x2=800, y2=0}
  screen.right = {x1=screen.top.x2, y1=screen.top.y2, x2=screen.top.x2, y2=450}
  screen.bottom = {x1=screen.top.x1, y1=screen.right.y2, x2=screen.top.x2, y2=screen.right.y2}
  screen.left = {x1=screen.top.x1, y1=screen.top.y1, x2=screen.bottom.x1, y2=screen.bottom.y1}
  screen.w = screen.top.x2 - screen.top.x1
  screen.h = screen.left.y2 - screen.left.y1
  
  -- Définition de la largeur et du nombre de colonnes.
  col_w = 94
  nb_col = screen.w/col_w
  largeur_decor = math.floor(nb_col)*col_w
  diff = screen.w - largeur_decor
  diff2 = col_w - diff
  --print(screen.w, largeur_decor)
  
  -- Définition de la position y du tank.
  tank.y = screen.top.y1+screen.h-25-tank.h-roue.h
  
  -- Création des colonnes. Pour la position x (troisième paramètres), on part du bord gauche de la
  -- zone de jeu et on multiplie l'index en cours de la boucle par la largeur d'une colonne.
  lst_col = {}
  for i=1,nb_col+2 do
    Create_Col(col_w, screen.top.y1+screen.h-25, screen.left.x1+(i-2)*col_w)
  end
  
  -- Load du sprite du tank.
  Create_Tank()
  Create_Roue()
end

function Game.Update(dt)
  -- On parcourt la liste des colonnes à l'envers. On update la position x de chaque colonne. Si une
  -- colonne sort complètement du bord gauche de l'écran, on la supprime de liste et on en crée une
  -- nouvelle à droite.
  
  if love.keyboard.isDown("right") then
    roue.r = roue.r+5*dt
    for i=#lst_col,1,-1 do
      local col = lst_col[i]
      col.x = col.x - 1
      if col.x+col.w <= screen.left.x1 then
        table.remove(lst_col, i)
        Create_Col(col_w, screen.top.y1+screen.h-25, screen.left.x1-1+#lst_col*col_w)
      end
    end
    if tank.x+tank.w <= screen.right.x1 then
      tank.x = tank.x + 15*dt
    end
  end
  if love.keyboard.isDown("left") then
    roue.r = roue.r-5*dt
    for i=#lst_col,1,-1 do
      local col = lst_col[i]
      col.x = col.x + 1
      if col.x >= screen.right.x1 then
        Create_Col(col_w, screen.top.y1+screen.h-25, col.x+1-#lst_col*col_w)
        table.remove(lst_col, i)
      end
    end
    if tank.x >= screen.left.x1 then
      tank.x = tank.x - 15*dt
    end
  end
end

function Game.Draw()
  love.graphics.setBackgroundColor(0.55, 0.82, 0.61)
  -- On crée un scissor de la dimension de la zone de jeu pour n'afficher que celle-ci. Cela permet notamment
  -- de masquer les parties des colonnes qui sont hors de la zone de jeu.
  love.graphics.setScissor(screen.top.x1, screen.top.y1, screen.right.x1-screen.left.x1, screen.bottom.y1-screen.top.y1)
  love.graphics.setColor(0.17, 0.13, 0.85)
  -- Affichage du ciel (sur toute la zone de jeu).
  love.graphics.rectangle("fill", screen.left.x1, screen.top.y1, screen.right.x1-screen.left.x1, screen.bottom.y1-screen.top.y1)
  love.graphics.setColor(0.75, 0.37, 0.48)
  -- Affichage du sol, la hauteur est codée en dur. Faire atteintion si on modifie la popsition y du spawn
  -- des colonnes.
  love.graphics.rectangle("fill", screen.left.x1, screen.bottom.y1-30, screen.right.x1-screen.left.x1, 30)
  love.graphics.setColor(1, 1, 1)
  
  -- Affichage des colonnes.
  for i=#lst_col,1,-1 do
    local col = lst_col[i]
    love.graphics.setColor(col.grey_scale, col.grey_scale, col.grey_scale)
    love.graphics.rectangle("fill", col.x, col.y, col.w, col.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.print(tostring(i), col.x+5, col.y+5)
    love.graphics.print(tostring(col.x), col.x+5, col.y-20)
    love.graphics.setColor(1, 1, 1)
  end
  
  -- Affichage du tank.
  love.graphics.draw(tank.img, tank.x, tank.y)
  for i=1,3 do
    love.graphics.draw(roue.img, tank.x+(i-1)*40 + roue.w/2, tank.y+tank.h + roue.w/2, roue.r, 1, 1, roue.w/2, roue.w/2)
  end
  
  -- Affichages d'un cadre autour de la zone de jeu (dispensable).
  love.graphics.setColor(1, 1, 0)
  love.graphics.line(screen.top.x1, screen.top.y1, screen.top.x2, screen.top.y2)
  love.graphics.line(screen.right.x1, screen.right.y1, screen.right.x2, screen.right.y2)
  love.graphics.line(screen.bottom.x1, screen.bottom.y1, screen.bottom.x2, screen.bottom.y2)
  love.graphics.line(screen.left.x1, screen.left.y1, screen.left.x2, screen.left.y2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setScissor()
  -- ## Fin du scissor. ##
  
  -- Affichage de quelques infos.
  love.graphics.print("Jeu", 5, 5)
  love.graphics.print("nb_col: "..tostring(#lst_col), 5, 5+16)
end

function Game.Keypressed(key)
  if key == "space" then
    lst_col = {}
    for i=1,nb_col+2 do
      Create_Col(col_w, screen.top.y1+screen.h-25, screen.left.x1+(i-2)*col_w)
    end
  end
end

function Game.Mousepressed(x, y, button)
  
end

return Game