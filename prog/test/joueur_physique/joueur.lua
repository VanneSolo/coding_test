function Create_Joueur()
  nouveau_joueur = {}
  
  function nouveau_joueur.Load()
    donnees = {}
    donnees.x = largeur/2
    donnees.y = hauteur/2
    donnees.w = 50
    donnees.h = 50
    --table.insert(nouveau_joueur, donnees)
  end
  
  function nouveau_joueur.Update(dt)
    if love.keyboard.isDown("right") then
      donnees.x = donnees.x + 10
    end
    if love.keyboard.isDown("left") then
      donnees.x = donnees.x - 10
    end
  end
  
  function nouveau_joueur.Draw()
    love.graphics.rectangle("line", donnees.x, donnees.y, donnees.w, donnees.h)
  end
  
  return nouveau_joueur
end