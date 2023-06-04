-- Création d'une map à base de tuiles.
function Cree_Tuile(pI, pJ)
  local tuile = {}
  tuile.i = pI
  tuile.j = pJ
  tuile.x = (pJ-1)*tile_size
  tuile.y = (pI-1)*tile_size
  tuile.alpha = 0.9
  return tuile
end

function Cree_Map()
  local map = {}
  for i=1,nb_lig do
    ligne = {}
    table.insert(map, ligne)
    for j=1,nb_col do
      carre = Cree_Tuile(i,j)
      table.insert(map[i], carre)
    end
  end
  return map
end

function Draw_Map(pMap)
  for i=1,nb_lig do
    for j=1,nb_col do
      love.graphics.setColor(0, 0, 0, pMap[i][j].alpha)
      love.graphics.rectangle("fill", pMap[i][j].x, pMap[i][j].y, tile_size, tile_size)
    end
  end
  love.graphics.setColor(1, 1, 1)
end

-- Copie du contenu d'une table dans une autre.
function Copie_Table(pTable)
  local new_table = {}
  for i=1,#pTable do
    table.insert(new_table, pTable[i])
  end
  return new_table
end

-- Récupération de la plus petite valeur ou de la plus grande vleur d'un tableau.
function Table_Min_Value(pTable)
  local copie = Copie_Table(pTable)
  table.sort(copie)
  local min = pTable[1]
  return min
end

function Table_Max_Value(pTable)
  local copie = Copie_Table(pTable)
  table.sort(copie)
  local max = pTable[#pTable]
  return max
end

-- Crée une sorte de chaine de montagne.
function Make_2D_Mountains(pTable, pRange_X, pRange_Y, p_K_Range_Y, pOffset_Y)
  local minimum = Table_Min_Value(pTable)
  local maximum = Table_Max_Value(pTable)
  local p = {}
  local p2 = {}
  for i=1,#pTable do
    sections = {}
    sections.norm_value = Norm_Number(pTable[i], minimum, maximum)
    sections.x = pRange_X/(#pTable-1)*(i-1)
    sections.y = ((pRange_Y/p_K_Range_Y) - (pRange_Y/p_K_Range_Y)*sections.norm_value) + pOffset_Y
    table.insert(p2, sections)
  end

  p.Draw_Lines = function()
    for i=1,#p2-1 do
      love.graphics.line(p2[i].x, p2[i].y, p2[i+1].x, p2[i+1].y)
    end
  end
  
  p.Draw_Points = function()
    for i=1,#p2 do
      love.graphics.setColor(1, 0, 0)
      love.graphics.points(p2[i].x, p2[i].y)
      love.graphics.setColor(1, 1, 1)
    end
  end
  return p
end

-- Crée un point qui grossit et devient de plus en plus opaque.
function Point_Deformable(p_min_x, p_max_x, p_min_y, p_max_y, p_min_radius, p_max_radius, p_t_max)
  local settings = {}
  settings.x = p_min_x
  settings.y = p_min_y
  settings.r = p_min_radius
  settings.g_alpha = 0
  settings.min_alpha = 0
  settings.max_alpha = 1
  settings.t = 0
  local p = {}
  p.Update = function(dt)
    settings.g_alpha = Lerp(settings.t, settings.min_alpha, settings.max_alpha)
    settings.x = Lerp(settings.t, p_min_x, p_max_x)
    settings.y = Lerp(settings.t, p_min_y, p_max_y)
    settings.r = Lerp(settings.t, p_min_radius, p_max_radius)
    settings.t = settings.t + 0.01
    if settings.t >= p_t_max then
      settings.t = 0
    end
  end
  p.Draw = function()
    love.graphics.setColor(1, 1, 1, settings.g_alpha)
    love.graphics.circle("fill", settings.x, settings.y, settings.r)
    love.graphics.setColor(1, 1, 1, 1)
  end
  return p
end

-- Cloisonne un rond à l'intérieur d'une zone rectangulaire
function Clamp_Circle_Inside_Rect(k1, k2, p_rond, p_rect)
  p_rond.x = Clamp(k1, p_rect.x+p_rond.r, p_rect.x+p_rect.w-p_rond.r)
  p_rond.y = Clamp(k2, p_rect.y+p_rond.r, p_rect.y+p_rect.h-p_rond.r)
end