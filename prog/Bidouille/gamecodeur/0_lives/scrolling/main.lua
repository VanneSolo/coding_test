io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  liste_carres = {}
  for i=1,12 do
    carre = {}
    carre.x = 73
    carre.y = 500
    carre.w = 20
    table.insert(liste_carres, carre)
  end
  
  scroll = 0
end

function love.update(dt)
  scroll = scroll - 1
  if scroll <= -largeur then
    scroll = 0
  end
end

function love.draw()
  for i=1, #liste_carres do
    love.graphics.rectangle("fill", ((i-1)*liste_carres[i].x)+scroll, liste_carres[i].y, liste_carres[i].w, liste_carres[i].w)
    love.graphics.rectangle("fill", (i*liste_carres[i].x)+scroll+largeur, liste_carres[i].y, liste_carres[i].w, liste_carres[i].w)
  end
  love.graphics.setColor(0, 0, 1)
  love.graphics.line(largeur+scroll, 0, largeur+scroll, hauteur)
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.print(scroll, 10, 10)
end