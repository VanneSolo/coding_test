io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  bouton = {}
  bouton.x = 10
  bouton.y = 10
  bouton.w = 120
  bouton.h = 40
  bouton.rx = 5
  bouton.ry = 5
  
  etape = {}
  etape.attente = "Attente"
  etape.compte = "Compte à rebours"
  etape.feu = "Mise à feu"
  etape.decollage = "Décollage"
  
  current_state = etape.attente
  
  fusee = {}
  fusee.img = love.graphics.newImage("fusee.png")
  fusee.img_motor = love.graphics.newImage("flamme.png")
  fusee.w = fusee.img:getWidth()
  fusee.h = fusee.img:getHeight()
  fusee.x = (largeur - fusee.w)/2
  fusee.y = hauteur - fusee.h
  fusee.vitesse = 0
  fusee.motor = false
end

function love.update(dt)
  if current_state == etape.compte then
    if fusee.motor == false then
      fusee.motor = true
    end
  elseif current_state == etape.feu then
    
  elseif current_state == etape.decollage then
    fusee.y = fusee.y - fusee.vitesse
  end
  fusee.vitesse = fusee.vitesse + 0.1*dt
end

function love.draw()
  love.graphics.rectangle("fill", bouton.x, bouton.y, bouton.w, bouton.h, bouton.rx, bouton.ry)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(current_state, bouton.x + 5, bouton.y + 12)
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(fusee.img, fusee.x, fusee.y)
  if fusee.motor == true then
    love.graphics.draw(fusee.img_motor, fusee.x, fusee.y)
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    print(x, y)
    
    if Is_On_Button(x, y, bouton) then
      if current_state == etape.attente then
        current_state = etape.compte
        print("Change d'étape!")
      elseif current_state == etape.compte then
        current_state = etape.feu
        print("Change d'étape!")
      elseif current_state == etape.feu then
        current_state = etape.decollage
      end
    end
  end
end

function Is_On_Button(pX, pY, pButton)
  if pX >= pButton.x and pX <= pButton.x + pButton.w and pY >= pButton.y and pY <= pButton.y + pButton.h then
    print("Je suis sur le bouton!")
    return true
  end
  return false
end