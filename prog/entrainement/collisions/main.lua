io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
	local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
	local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
	local det,x,y = a1*b2 - a2*b1
	if det==0 then return false, "The lines are parallel." end
	x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
	if seg1 or seg2 then
		local min,max = math.min, math.max
		if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
		   seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
			return false, "The lines don't intersect."
		end
	end
	return x,y
end

vaisseau = {}
vaisseau.canvas_w = 80
vaisseau.canvas_h = 80
vaisseau.canvas_x = 360
vaisseau.canvas_y = 260
vaisseau.p1x = 10
vaisseau.p1y = 70
vaisseau.p2x = 40
vaisseau.p2y = 10
vaisseau.p3x = 70
vaisseau.p3y = 70
vaisseau.img = love.graphics.newCanvas(vaisseau.canvas_w, vaisseau.canvas_h)
function Load_Ship()
  love.graphics.setCanvas(vaisseau.img)
  love.graphics.setColor(0.21, 0.68, 0.17)
  --love.graphics.rectangle("fill", 0, 0, vaisseau.canvas_w, vaisseau.canvas_h)
  love.graphics.setColor(1, 0, 0)
  love.graphics.polygon("fill", vaisseau.p1x, vaisseau.p1y, vaisseau.p2x, vaisseau.p2y, vaisseau.p3x, vaisseau.p3y)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

bullet = {}
bullet.canvas_w = 20
bullet.canvas_h = 70
bullet.canvas_x = 310
bullet.canvas_y = 190
bullet.rect_w = 10
bullet.rect_h = 60
bullet.rect_x = 5
bullet.rect_y = 5
bullet.img = love.graphics.newCanvas(bullet.canvas_w, bullet.canvas_h)
function Load_Bullet()
  love.graphics.setCanvas(bullet.img)
  love.graphics.setColor(0.68, 0.21, 0.17)
  --love.graphics.rectangle("fill", 0, 0, bullet.canvas_w, bullet.canvas_h)
  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle("fill", bullet.rect_x, bullet.rect_y, bullet.rect_w, bullet.rect_h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

old_x = bullet.canvas_x
old_y = bullet.canvas_y
new_x = bullet.canvas_x
new_y = bullet.canvas_y
direction_x = 0
direction_y = 0

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Load_Ship()
  Load_Bullet()
  
  haut = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y
  }
  droite = {
    x1=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  bas = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y+bullet.rect_h, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  gauche = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  
  aile_g = {
    x1=vaisseau.canvas_x+vaisseau.p2x,
    y1=vaisseau.canvas_y+vaisseau.p2y,
    x2=vaisseau.canvas_x+vaisseau.p1x,
    y2=vaisseau.canvas_y+vaisseau.p1y
  }
  aile_d = {
    x1=vaisseau.canvas_x+vaisseau.p2x,
    y1=vaisseau.canvas_y+vaisseau.p2y,
    x2=vaisseau.canvas_x+vaisseau.p3x,
    y2=vaisseau.canvas_y+vaisseau.p3y
  }
  base = {
    x1=vaisseau.canvas_x+vaisseau.p1x,
    y1=vaisseau.canvas_y+vaisseau.p1y,
    x2=vaisseau.canvas_x+vaisseau.p3x,
    y2=vaisseau.canvas_y+vaisseau.p3y
  }
  
  collide_bb = false
  touche_g = false
  touche_d = false
end

function love.update(dt)
  collide_bb = false
  touche_g = false
  touche_d = false
  
  haut = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y
  }
  droite = {
    x1=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  bas = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y+bullet.rect_h, 
    x2=bullet.canvas_x+bullet.rect_x+bullet.rect_w, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  gauche = {
    x1=bullet.canvas_x+bullet.rect_x, 
    y1=bullet.canvas_y+bullet.rect_y, 
    x2=bullet.canvas_x+bullet.rect_x, 
    y2=bullet.canvas_y+bullet.rect_y+bullet.rect_h
  }
  
  if CheckCollision(bullet.canvas_x, bullet.canvas_y, bullet.canvas_w, bullet.canvas_h, vaisseau.canvas_x, vaisseau.canvas_y, vaisseau.canvas_w, vaisseau.canvas_h) then
    collide_bb = true
  end
  
  if collide_bb then
    touche_g = findIntersect(bas.x1, bas.y1, bas.x2, bas.y2, aile_g.x1, aile_g.y1, aile_g.x2, aile_g.y2, true, true)
    touche_d = findIntersect(bas.x1, bas.y1, bas.x2, bas.y2, aile_d.x1, aile_d.y1, aile_d.x2, aile_d.y2, true, true)
  end
  
  if touche_g or touche_d then
    bullet.canvas_x = old_x
    bullet.canvas_y = old_y
  end
  
  direction_x = new_x-old_x
  direction_y = new_y-old_y
end

function love.draw()
  love.graphics.draw(vaisseau.img, vaisseau.canvas_x, vaisseau.canvas_y)
  love.graphics.draw(bullet.img, bullet.canvas_x, bullet.canvas_y)
  
  love.graphics.setColor(0, 0, 1)
  love.graphics.line(haut.x1, haut.y1, haut.x2, haut.y2)
  love.graphics.line(droite.x1, droite.y1, droite.x2, droite.y2)
  love.graphics.line(bas.x1, bas.y1, bas.x2, bas.y2)
  love.graphics.line(gauche.x1, gauche.y1, gauche.x2, gauche.y2)
  
  love.graphics.line(aile_g.x1, aile_g.y1, aile_g.x2, aile_g.y2)
  love.graphics.line(aile_d.x1, aile_d.y1, aile_d.x2, aile_d.y2)
  love.graphics.line(base.x1, base.y1, base.x2, base.y2)
  love.graphics.setColor(1, 1, 1)
  
  if touche_g then
    love.graphics.setColor(1, 0, 0)
    love.graphics.line(bas.x1, bas.y1, bas.x2, bas.y2)
    love.graphics.setColor(1, 1, 0)
    love.graphics.line(aile_g.x1, aile_g.y1, aile_g.x2, aile_g.y2)
    love.graphics.setColor(1, 1, 1)
  elseif touche_d then
    love.graphics.setColor(0, 1, 0)
    love.graphics.line(bas.x1, bas.y1, bas.x2, bas.y2)
    love.graphics.setColor(1, 1, 0)
    love.graphics.line(aile_d.x1, aile_d.y1, aile_d.x2, aile_d.y2)
    love.graphics.setColor(1, 1, 1)
  end
  
  
  love.graphics.print("bullet.x: "..tostring(bullet.canvas_x)..", bullet.y: "..tostring(bullet.canvas_y), 5, 5)
  love.graphics.print("old_x: "..tostring(old_x)..", old_y: "..tostring(old_y), 5, 5+16)
  love.graphics.print("new_x: "..tostring(new_x)..", new_y: "..tostring(new_y), 5, 5+16*2)
  love.graphics.print("direction_x: "..tostring(direction_x)..", direction_y: "..tostring(direction_y), 5, 5+16*3)
  love.graphics.print("collide bb: "..tostring(collide_bb), 5, 5+16*4)
end

function love.keypressed(key)
  if key == "up" then
    bullet.canvas_y = bullet.canvas_y - 5
    new_y = bullet.canvas_y
    old_y = new_y + 5
  end
  if key == "right" then
    bullet.canvas_x = bullet.canvas_x + 5
    new_x = bullet.canvas_x
    old_x = new_x - 5
  end
  if key == "down" then
    bullet.canvas_y = bullet.canvas_y + 5
    new_y = bullet.canvas_y
    old_y = new_y - 5
  end
  if key == "left" then
    bullet.canvas_x = bullet.canvas_x - 5
    new_x = bullet.canvas_x
    old_x = new_x + 5
  end
end