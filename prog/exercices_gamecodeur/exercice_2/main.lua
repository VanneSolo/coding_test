io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  piece_echec = {}
  piece_echec_quad = {}
  
  function Create_Quad(pImgFile, pNbSprite)
    sprite = {}
    sprite.img = love.graphics.newImage(pImgFile)
    sprite.width, sprite.height = sprite.img:getDimensions()
    sprite.local_width = sprite.width/pNbSprite
    for i = 1, sprite.width, sprite.local_width do
      sprite.quad_morceau = love.graphics.newQuad(0+(i-1), 0, sprite.local_width, sprite.height, sprite.img:getDimensions())
      table.insert(piece_echec_quad, sprite.quad_morceau)
    end
    table.insert(piece_echec, sprite)
    return sprite
  end
  
  chess_piece = Create_Quad("piece_spritesheet.png", 6)
  
  longueur_du_cote = 65
  nombre_de_cases = 8
  cote_du_damier = longueur_du_cote*nombre_de_cases
  reste_vertical = (hauteur - cote_du_damier)/2
  reste_horizontal = (largeur - cote_du_damier)/2
  reste_cote = (longueur_du_cote-sprite.local_width)/2
  
  centrer_le_damier_vertical = (largeur/2) - (cote_du_damier/2)
  centrer_le_damier_horizontal = (hauteur/2) - (cote_du_damier/2)
  
  ligne_damier_vertical = 0
  ligne_damier_horizontal = 0
  
  ligne = 0
  colonne = 0
  
  balise_depart_vertical = hauteur - reste_vertical
  balise_fin_vertical = reste_vertical + longueur_du_cote
  pas_vertical = -longueur_du_cote
  
  balise_depart_horizontal = reste_horizontal
  balise_fin_horizontal = largeur - (reste_horizontal+longueur_du_cote)
  pas_horizontal = longueur_du_cote
  
  lettres = {"A","B","C","D","E","F","G","H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
  
  ligne_cliquee = 0
  colonne_cliquee = 0
end

function love.update(dt)
  
end

function love.draw()  
  for n = balise_depart_vertical, balise_fin_vertical, pas_vertical do
    ligne_damier_vertical = (n-reste_vertical) / longueur_du_cote
    love.graphics.print(ligne_damier_vertical, (largeur/2)-(cote_du_damier/2)-40, hauteur-n+(longueur_du_cote/2))
  end
      
  for k = balise_depart_horizontal, balise_fin_horizontal, pas_horizontal do
    ligne_damier_horizontal = (k-reste_horizontal) / longueur_du_cote
    love.graphics.print(lettres[ligne_damier_horizontal+1], k+(longueur_du_cote/2), (hauteur/2)-(cote_du_damier/2)-20)
  end
  
  for i=1, cote_du_damier, longueur_du_cote do
    ligne = ((i-1) / longueur_du_cote)+1
    for j=1, cote_du_damier, longueur_du_cote do
      colonne = ((j-1) / longueur_du_cote)+1
      
      if (ligne%2 == 0 and colonne%2 == 0) or (ligne%2 == 1 and colonne%2 == 1) then
        love.graphics.setColor(0.75, 0, 0.12)
        love.graphics.rectangle("fill", i+centrer_le_damier_vertical, j+centrer_le_damier_horizontal, longueur_du_cote, longueur_du_cote)
      else
        love.graphics.setColor(0.08, 1, 0.52)
        love.graphics.rectangle("fill", i+centrer_le_damier_vertical, j+centrer_le_damier_horizontal, longueur_du_cote, longueur_du_cote)
      end
      
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(chess_piece.img, piece_echec_quad[6], (reste_horizontal+(longueur_du_cote*4))+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[5], (reste_horizontal+(longueur_du_cote*3))+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[1], reste_horizontal+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[1], (reste_horizontal+(longueur_du_cote*7))+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[2], (reste_horizontal+longueur_du_cote)+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[2], (reste_horizontal+(longueur_du_cote*6))+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[4], (reste_horizontal+(longueur_du_cote*2))+reste_cote, reste_vertical+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[4], (reste_horizontal+(longueur_du_cote*5))+reste_cote, reste_vertical+reste_cote)
      
      for i=1, cote_du_damier, longueur_du_cote do
        love.graphics.draw(chess_piece.img, piece_echec_quad[3], (reste_horizontal+i)+reste_cote, (reste_vertical+longueur_du_cote)+reste_cote)
      end
      
      love.graphics.setColor(0, 0, 0)
      love.graphics.draw(chess_piece.img, piece_echec_quad[6], (reste_horizontal+(longueur_du_cote*4))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[5], (reste_horizontal+(longueur_du_cote*3))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[1], reste_horizontal+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[1], (reste_horizontal+(longueur_du_cote*7))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[2], (reste_horizontal+(longueur_du_cote))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[2], (reste_horizontal+(longueur_du_cote*6))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[4], (reste_horizontal+(longueur_du_cote*2))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      love.graphics.draw(chess_piece.img, piece_echec_quad[4], (reste_horizontal+(longueur_du_cote*5))+reste_cote, (reste_vertical+(longueur_du_cote*7))+reste_cote)
      
      for i=1, cote_du_damier, longueur_du_cote do
        love.graphics.draw(chess_piece.img, piece_echec_quad[3], (reste_horizontal+i)+reste_cote, (reste_vertical+longueur_du_cote*6)+reste_cote)
      end
      
      love.graphics.setColor(1, 1, 1)
    end
  end
  
end

function love.mousepressed(x, y, button)
  if button == 1 then
    ligne_cliquee = math.floor(((cote_du_damier-y+reste_vertical)/longueur_du_cote)+1)
    colonne_cliquee = math.floor(((x-reste_horizontal)/longueur_du_cote)+1)
    
    if ligne_cliquee < 1 or ligne_cliquee > nombre_de_cases or colonne_cliquee < 1 or colonne_cliquee > nombre_de_cases then
      print("Vous avez cliqué en dehors du damier")
    else
      print("Vous avez cliqué sur la ligne "..tostring(ligne_cliquee).." et sur la colonne "..tostring(lettres[colonne_cliquee]))
    end
  end
end