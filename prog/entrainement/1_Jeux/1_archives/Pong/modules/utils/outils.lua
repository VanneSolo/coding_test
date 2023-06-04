--[[

	Importer ici les fonctions mon fichier utils du dossier work.
	Fonctions purement utilitaire, déplacement du sprite.

]]

function Copie_Table(p_table)
  local table_clone = {}
  for i=1,#p_table do
    table.insert(table_clone, p_table[i])
  end
  return table_clone
end

function Table_Min_Value(p_table)
  local copie = Copie_Table(p_table)
  table.sort(copie)
  local minimum = copie[1]
  return minimum
end

function Table_Max_Value(p_table)
  local copie = Copie_Table(p_table)
  table.sort(copie)
  local maximum = copie[#copie]
  return maximum
end

function Swap(a, b)
  local temp = a
  a = b
  b = temp
  return a, b
end

function Include_Points_In_Table(p1, p2, p3, ...)
  local liste_acceuil = {p1, p2, p3, ...}
  local liste_retour = {}
  for i=1,#liste_acceuil do
    table.insert(liste_retour, liste_acceuil[i].x)
    table.insert(liste_retour, liste_acceuil[i].y)
  end
  return liste_retour
end

function Create_1_D_Table(p_table)
  local one_dimension_table = {}
  for i=1,p_table do
    table.insert(one_dimension_table, p_table[i].x)
    table.insert(one_dimension_table, p_table[i].y)
  end
  return one_dimension_table
end

function RND()
  return love.math.random()
end

-- Affichage d'un texte.

function Display_Texte(text, x, y, color)
	love.graphics.setColor(color)
	love.graphics.print(text, x, y)
	love.graphics.setColor(1, 1, 1, 1)
end

