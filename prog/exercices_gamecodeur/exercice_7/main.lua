io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  vitesse_actuelle = 0
  vitesse_enregistree = 0
  
  vitesse_negative = false
end

function love.update(dt)
  if vitesse_actuelle < vitesse_enregistree then
    vitesse_actuelle = vitesse_actuelle + dt
    if vitesse_actuelle >= vitesse_enregistree then
      vitesse_actuelle = vitesse_enregistree
    end
  end
  
  if vitesse_actuelle > vitesse_enregistree then
    vitesse_actuelle = vitesse_actuelle - dt
    if vitesse_actuelle <= vitesse_enregistree then
      vitesse_actuelle = vitesse_enregistree
    end
    if vitesse_enregistree <= 0 then
      vitesse_enregistree = 0
      vitesse_negative = true
    end
  end
end

function love.draw()
  love.graphics.print("vitesse actuelle: "..tostring(vitesse_actuelle), 10, 10)
  love.graphics.print("vitesse enregistree: "..tostring(vitesse_enregistree), 10, 30)
  
  if vitesse_negative == true then
    love.graphics.print("La vitesse ne peut pas être négative.", 10, 50)
    vitesse_negative = false
  end
  
  love.graphics.rectangle("fill", 0, 100, vitesse_actuelle, 20)
  love.graphics.rectangle("fill", 0, 130, vitesse_enregistree, 20)
end

function love.keypressed(key)
  if key == "kp+" then
    vitesse_enregistree = vitesse_enregistree + 5
  end
  if key == "kp-" then
    vitesse_enregistree = vitesse_enregistree - 5
  end
end