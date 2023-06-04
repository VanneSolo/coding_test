if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  liste_sprites = {}
  
  ennemi = {}
  ennemi.img = love.graphics.newImage("pnj.jpg")
  ennemi.x = love.graphics.getWidth()/2
  ennemi.y = love.graphics.getHeight()/2
  ennemi.ox = ennemi.img:getWidth()/2
  ennemi.oy = ennemi.img:getHeight()/2
  table.insert(liste_sprites, ennemi)
  
  joueur = {}
  joueur.img = love.graphics.newImage("joueur.jpg")
  joueur.x = 10
  joueur.y = 300
  joueur.ox = joueur.img:getWidth()/2
  joueur.oy = joueur.img:getHeight()/2
  joueur.pied = joueur.img:getHeight()/4
  table.insert(liste_sprites, joueur)
  
  haut_plage = 250
  bas_plage = 450
end

function tri_liste(sprite_a, sprite_b)
  return sprite_a.y < sprite_b.y
end

function love.update(dt)
  if love.keyboard.isDown("up") and joueur.y + joueur.pied >= haut_plage then
    joueur.y = joueur.y - 2*60*dt
  end
  if love.keyboard.isDown("right") then
    joueur.x = joueur.x + 2*60*dt
  end
  if love.keyboard.isDown("down") and joueur.y + joueur.pied <= bas_plage then
    joueur.y = joueur.y + 2*60*dt
  end
  if love.keyboard.isDown("left") then
    joueur.x = joueur.x - 2*60*dt
  end
  
  table.sort(liste_sprites, tri_liste)
end

function love.draw()
  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle("fill", 0, 0, 800, 250)
  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle("fill", 0, 250, 800, 200)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 0, 450, 800, 150)
  love.graphics.setColor(1, 1, 1)
  
  --love.graphics.draw(joueur.img, joueur.x, joueur.y, 0, 0.5, 0.5, joueur.ox, joueur.oy)
  --love.graphics.draw(ennemi.img, ennemi.x, ennemi.y, 0, 0.5, 0.5, ennemi.ox, ennemi.oy)
  
  for k, v in pairs(liste_sprites) do
    love.graphics.draw(v.img, v.x, v.y, 0, 0.5, 0.5, v.ox, v.oy)
  end
  
  --[[love.graphics.setColor(1, 0, 0)
  love.graphics.line(joueur.x, joueur.y + joueur.pied, joueur.x + joueur.img:getWidth(), joueur.y + joueur.pied)
  love.graphics.setColor(1, 1, 1)]]
  
  love.graphics.print("haut_plage: "..tostring(haut_plage), 10, 10)
  love.graphics.print("bas_plage: "..tostring(bas_plage), 10, 30)
  love.graphics.print("joueur.pied: "..tostring(joueur.y + joueur.pied), 10, 50)
end