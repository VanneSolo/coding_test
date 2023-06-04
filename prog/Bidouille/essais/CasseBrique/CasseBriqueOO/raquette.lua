raquette = {}
raquette.x = 0
raquette.y = 0
raquette.largeur = 50
raquette.hauteur = 15

function UpdateRaquette()
  raquette.x = love.mouse.getX()
end

function DrawRaquette()
  love.graphics.rectangle("fill", raquette.x - (raquette.largeur/2), hauteur - raquette.hauteur, raquette.largeur, raquette.hauteur)
end