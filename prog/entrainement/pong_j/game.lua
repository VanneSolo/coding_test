ecartement = 25

terrain = {}
terrain.w = 450
terrain.h = 350
terrain.x = ecartement
terrain.y = ecartement
terrain.img = love.graphics.newCanvas(terrain.w, terrain.h)
love.graphics.setCanvas(terrain.img)
love.graphics.setColor(0, 1, 0)
love.graphics.rectangle("fill", 0, 0, terrain.w, terrain.h)
love.graphics.setColor(1, 1, 1)
love.graphics.setCanvas()

balle = {}
balle.r = 5
balle.x = ecartement+terrain.w/2
balle.y = ecartement+terrain.h/2
balle.sx = 5
balle.sy = 5

function Update_Game(dt)
  if balle.x > ecartement+terrain.w - balle.r then
    balle.x = ecartement+terrain.w - balle.r
    balle.sx = -balle.sx
  elseif balle.x < ecartement + balle.r then
    balle.x = ecartement + balle.r
    balle.sx = -balle.sx
  end
  if balle.y > ecartement+terrain.h - balle.r then
    balle.y = ecartement+terrain.h - balle.r
    balle.sy = -balle.sy
  elseif balle.y < ecartement + balle.r then
    balle.y = ecartement + balle.r
    balle.sy = -balle.sy
  end
  
  balle.x = balle.x + balle.sx
  balle.y = balle.y + balle.sy
end

function Draw_Game()
  love.graphics.draw(terrain.img, terrain.x, terrain.y)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
  love.graphics.setColor(1, 1, 1)
end