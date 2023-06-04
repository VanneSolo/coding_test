function Create_Balle()
  parametres_rond = {}
  nouvelle_balle = {}
  
  function nouvelle_balle.Load()
    rond = {}
    rond.x = 20
    rond.y = 20
    rond.radius = 20
    table.insert(parametres_rond, rond)
    
    rond_ligne = love.graphics.newCanvas(40, 40)
    love.graphics.setCanvas(rond_ligne)
    love.graphics.circle("line", rond.x, rond.y, rond.radius)
    love.graphics.line(rond.x, rond.y, rond.x+rond.radius, rond.y)
    love.graphics.setCanvas()
    table.insert(nouvelle_balle, rond_ligne)
  end
  
  function nouvelle_balle.Draw()
    love.graphics.draw(rond_ligne, 100, 100)
  end
  
  return nouvelle_balle
end