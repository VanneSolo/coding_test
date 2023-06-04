function Demarre(pLineMax, pColMax)
  niveau = {}
  for l = 1,pLineMax do
    niveau[l] = {}
    for c = 1,pColMax do
      niveau[l][c] = 1
    end
  end
end

function DrawGrid(pDrawLineMax, pDrawColMax)
  brique = {}
  brique.largeur = largeur / pDrawColMax
  brique.hauteur = 15
  
  nombreColonnes = pDrawColMax
  
  briqueL = 0
  briqueH = 0
  
  for l = 1,pDrawLineMax do
    briqueL = 0
    for c = 1,pDrawColMax do
      if niveau[l][c] == 1 then
        love.graphics.rectangle("fill", briqueL, briqueH+1, brique.largeur-1, brique.hauteur-1)
      end
      briqueL = briqueL + brique.largeur
    end
    briqueH = briqueH + brique.hauteur
  end
end