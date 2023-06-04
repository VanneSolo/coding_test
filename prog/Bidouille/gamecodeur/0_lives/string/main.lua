function love.load()
  chaine = "caca dans les raviolis"
  chaine_2 = "Ça vous va"
  fonte = love.graphics.newFont("JMH Typewriter-Bold.ttf", 20)
  fonte_2 = love.graphics.newFont("Alien Remix.ttf", 20)
  
  
end

function love.update(dt)
end

function love.draw()
  love.graphics.setFont(fonte)
  centrer_chaine_1 = (love.graphics.getWidth() - fonte:getWidth(chaine))/2
  love.graphics.print(chaine, centrer_chaine_1, 15)
  
  love.graphics.setFont(fonte_2)
  centrer_chaine_2 = (love.graphics.getWidth() - fonte_2:getWidth(chaine_2))/2
  love.graphics.print(chaine_2, centrer_chaine_2, 40)
end