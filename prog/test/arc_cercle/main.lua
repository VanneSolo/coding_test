function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  pi = math.pi
end

function love.update(dt)
end

function love.draw()
  
  love.graphics.arc("line", 25, 25, 20, 0, pi/6, 8)
  love.graphics.arc("line", 25, 75, 20, 0, (2*pi)/6, 8)
  love.graphics.arc("line", 25, 125, 20, 0, (3*pi)/6, 8)
  love.graphics.arc("line", 25, 175, 20, 0, (4*pi)/6, 8)
  love.graphics.arc("line", 25, 225, 20, 0, (5*pi)/6, 8)
  love.graphics.arc("line", 25, 275, 20, 0, (6*pi)/6, 8)
  love.graphics.arc("line", 25, 325, 20, 0, (7*pi)/6, 10)
  love.graphics.arc("line", 25, 375, 20, 0, (8*pi)/6, 12)
  love.graphics.arc("line", 25, 425, 20, 0, (9*pi)/6, 14)
  love.graphics.arc("line", 25, 475, 20, 0, (10*pi)/6, 16)
  love.graphics.arc("line", 25, 525, 20, 0, (11*pi)/6, 18)
  love.graphics.arc("line", 25, 575, 20, 0, (12*pi)/6, 20)
  
  love.graphics.arc("line", 75, 25, 20, 0, pi/5, 8)
  love.graphics.arc("line", 75, 75, 20, 0, 2*pi/5, 8)
  love.graphics.arc("line", 75, 125, 20, 0, 3*pi/5, 8)
  love.graphics.arc("line", 75, 175, 20, 0, 4*pi/5, 8)
  love.graphics.arc("line", 75, 225, 20, 0, 5*pi/5, 8)
  love.graphics.arc("line", 75, 275, 20, 0, 6*pi/5, 10)
  love.graphics.arc("line", 75, 325, 20, 0, 7*pi/5, 12)
  love.graphics.arc("line", 75, 375, 20, 0, 8*pi/5, 14)
  love.graphics.arc("line", 75, 425, 20, 0, 9*pi/5, 16)
  love.graphics.arc("line", 75, 475, 20, 0, 10*pi/5, 18)
  
  love.graphics.arc("line", 125, 25, 20, 0, pi/4, 8)
  love.graphics.arc("line", 125, 75, 20, 0, 2*pi/4, 8)
  love.graphics.arc("line", 125, 125, 20, 0, 3*pi/4, 8)
  love.graphics.arc("line", 125, 175, 20, 0, 4*pi/4, 8)
  love.graphics.arc("line", 125, 225, 20, 0, 5*pi/4, 10)
  love.graphics.arc("line", 125, 275, 20, 0, 6*pi/4, 12)
  love.graphics.arc("line", 125, 325, 20, 0, 7*pi/4, 14)
  love.graphics.arc("line", 125, 375, 20, 0, 8*pi/4, 16)
  
  love.graphics.arc("line", 175, 25, 20, 0, pi/3, 8)
  love.graphics.arc("line", 175, 75, 20, 0, 2*pi/3, 8)
  love.graphics.arc("line", 175, 125, 20, 0, 3*pi/3, 8)
  love.graphics.arc("line", 175, 175, 20, 0, 4*pi/3, 10)
  love.graphics.arc("line", 175, 225, 20, 0, 5*pi/3, 12)
  love.graphics.arc("line", 175, 275, 20, 0, 6*pi/3, 14)
  
  love.graphics.arc("line", 225, 25, 20, 0, pi/2, 8)
  love.graphics.arc("line", 225, 75, 20, 0, 2*pi/2, 8)
  love.graphics.arc("line", 225, 125, 20, 0, 3*pi/2, 12)
  love.graphics.arc("line", 225, 175, 20, 0, 4*pi/2, 16)
  
end