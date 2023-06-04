io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

--[[

TO DO

* Faire apparaitre une balle au milieu
* La faire partir vers la gauche selon un angle aléatoire
* Si la balle sort de l'écran, reprendre à l'étape 1

* Faire déplacer la raquette vers le point d'intersection entre elle et la balle
* Ajouter un temps de réaction à l'IA
* Ajouter un coef d'erreur au calcul du point d'intersection

]]

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

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

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

line_1 = {}
line_1.x1 = 100
line_1.y1 = 35
line_1.x2 = 185
line_1.y2 = 445

line_2 = {}
line_2.x1 = 22
line_2.y1 = 220
line_2.x2 = 350
line_2.y2 = 190

cross = false

balle = {}
balle.r = 5
balle.x = line_1.x2
balle.y = line_1.y2

move = false
click = false
start = false

click_point = {}

function love.load()
  love.graphics.setPointSize(3)
end

function love.update(dt)
  cross = false
  
  souris_x, souris_y = love.mouse.getPosition()
  line_1.x1 = souris_x
  line_1.y1 = souris_y
  
  croisement_x, croisement_y = findIntersect(line_1.x1, line_1.y1, line_1.x2, line_1.y2, line_2.x1, line_2.y1, line_2.x2, line_2.y2, true, true)
  if croisement_x and croisement_y then
    cross = true
  else
    cross = false
  end
  
  if click then
    new_x = love.mouse.getX()
    new_y = love.mouse.getY()
    table.insert(click_point, new_x)
    table.insert(click_point, new_y)
  end
  
  if start then
    trajectoire = math.angle(line_1.x2, line_1.y2, click_point[1], click_point[2])
  end
  
  if move then
    balle.x = balle.x + math.cos(trajectoire)
    balle.y = balle.y + math.sin(trajectoire)
  end
end

function love.draw()
  love.graphics.line(line_1.x1, line_1.y1, line_1.x2, line_1.y2)
  love.graphics.line(line_2.x1, line_2.y1, line_2.x2, line_2.y2)
  
  if cross then
    love.graphics.setColor(1, 0, 0)
    love.graphics.points(croisement_x, croisement_y)
    love.graphics.setColor(1, 1, 1)
  end
  
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.line(10, line_1.y2, 400, line_1.y2)
  
  if click then
    love.graphics.points(click_point[1], click_point[2])
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    move = true
    click = true
    start = true
  end
end