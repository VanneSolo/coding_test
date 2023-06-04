io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  loin = 10
  pres = 200
  
  liste_etoile = {}
  for i=1,150 do
    local etoile = {}
    etoile.x = love.math.random(0, largeur)
    etoile.y = love.math.random(0, hauteur)
    etoile.vitesse = love.math.random(loin, pres)
    local ecart = etoile.vitesse - loin
    local coef = ecart/(pres-loin)
    etoile.taille = (3*coef) + 1
    etoile.alpha = coef
    table.insert(liste_etoile, etoile)
  end
end

function love.update(dt)
  for i=1,#liste_etoile do
    local etoile = liste_etoile[i]
    etoile.x = etoile.x - etoile.vitesse*dt
    if etoile.x < 0 then
      etoile.x = largeur+1
    end
  end
end

function love.draw()
  for i=1,#liste_etoile do
    local etoile = liste_etoile[i]
    love.graphics.setColor(1, 1, 1, etoile.alpha)
    love.graphics.circle("fill", etoile.x, etoile.y, etoile.taille)
  end
  love.graphics.setColor(1, 1, 1, 1)
end