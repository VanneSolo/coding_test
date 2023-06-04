io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  timer_depart = 40
  depart_compte_a_rebours = false
  
  etapes = {}
  etapes[1] = "Evacuez la tour de lancement!"
  etapes[2] = "Préparation du pas de tir."
  etapes[3] = "Retirez les bras cryogéniques."
  etapes[4] = "Allumage des moteurs."
  etapes[5] = "Décollage!"
  
  etape_courante = 1
  
  fusee = {}
  fusee.x = 380
  fusee.y = 520
  fusee.vy = 5
  fusee.width = 40
  fusee.height = 80
end

function love.update(dt)
  if depart_compte_a_rebours == true then
    timer_depart = timer_depart - dt
    if timer_depart <= 0 then
      timer_depart = 0
    end
    
    if timer_depart <= 0 and etape_courante ~= 5 then
    etape_courante = 5
    elseif timer_depart <= 10 and timer_depart > 0 and etape_courante ~= 4 then
      etape_courante = 4
    elseif timer_depart <= 20 and timer_depart > 10 and etape_courante ~= 3 then
      etape_courante = 3
    elseif timer_depart <= 30 and timer_depart > 20 and etape_courante ~= 2 then
      etape_courante = 2
    end
    
    if etape_courante == 5 then
      fusee.y = fusee.y - fusee.vy
    end
    
  end
  
end

function love.draw()
  love.graphics.print("Compte à rebours: "..tostring(math.floor(timer_depart)), 1, 1)
  
  if depart_compte_a_rebours == true then
    love.graphics.print("Etat du lancement: "..tostring(etapes[etape_courante]), 1, 16)
  end
  
  love.graphics.rectangle("fill", fusee.x, fusee.y, fusee.width, fusee.height)
end

function love.keypressed(key)
  if key == "space" then
    depart_compte_a_rebours = true
  end
end