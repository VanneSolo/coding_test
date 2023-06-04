io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

--[[

TO DO

* Gérer les collisions entre la balle et l'IA
* Replacer la raquette au milieu si la balle sort de l'écran ou qu'elle s'éloigne de l'IA

]]

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
speed_game = 5

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

--function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

wall_thick = 20
murs = {}
murs[1] = {x=0, y=0, w=largeur, h=wall_thick}
murs[2] = {x=largeur-wall_thick, y=wall_thick, w=wall_thick, h=hauteur-(wall_thick*2)}
murs[3] = {x=0, y=hauteur-wall_thick, w=largeur, h=wall_thick}

balle = {}
balle.r = 5
balle.x = largeur/2
balle.y = hauteur/2
balle.vx = speed_game
balle.vy = speed_game
balle.angle = love.math.random(math.rad(-110), math.rad(-250))
balle.sortie = false
balle.wall_touch = false

adversaire = {}
adversaire.w = 10
adversaire.h = 50
adversaire.x = 10
adversaire.y = hauteur/2 - adversaire.h/2
adversaire.line_disp = {x1=adversaire.x+(adversaire.w/2), y1=-2000, x2=adversaire.x+(adversaire.w/2), y2=hauteur+2000}
adversaire.speed = speed_game
adversaire.tps_react = 0.5
adversaire.err_factor = 15
adversaire.move = false

function Spawn(pEntite, dt)
  if pEntite.x <= pEntite.r then
    balle.sortie = true
    pEntite.x = largeur/2
    pEntite.y = love.math.random(wall_thick+pEntite.r, hauteur-wall_thick-pEntite.r)
    adversaire.move = false
    adversaire.tps_react = 0.5
  end
  if balle.sortie then
    balle.angle = love.math.random(math.rad(-110), math.rad(-250))
    balle.sortie = false
  end
  pEntite.x = pEntite.x + pEntite.vx*math.cos(pEntite.angle)
  pEntite.y = pEntite.y + pEntite.vy*math.sin(pEntite.angle)
end

function love.load()
  
end

function love.update(dt)
  Spawn(balle, dt)
  
  if balle.x >= largeur-wall_thick-balle.r then
    balle.x = largeur-wall_thick-balle.r
    balle.vx = -balle.vx
  end
  if balle.y <= wall_thick+balle.r then
    balle.y = wall_thick+balle.r
    balle.vy = -balle.vy
    balle.wall_touch = true
  elseif balle.y >= hauteur-wall_thick-balle.r then
    balle.y = hauteur-wall_thick-balle.r
    balle.vy = -balle.vy
    balle.wall_touch = true
  end
  
  contact_balle_adversaire_x, contact_balle_adversaire_y = findIntersect(adversaire.line_disp.x1, adversaire.line_disp.y1, adversaire.line_disp.x2, adversaire.line_disp.y2,
    balle.x, balle.y, balle.x+balle.vx*math.cos(balle.angle), balle.y+balle.vy*math.sin(balle.angle))
  
  adversaire.tps_react = adversaire.tps_react - dt
  if adversaire.tps_react <= 0 then
    adversaire.move = true
  end
  
  if adversaire.move then
    if adversaire.y <= wall_thick*1.5 then
      adversaire.y = wall_thick*1.5
    elseif adversaire.y >= hauteur-wall_thick*1.5-adversaire.h then
      adversaire.y = hauteur-(wall_thick*1.5)-adversaire.h
    end

    if type(contact_balle_adversaire_y)=="number" then
      if contact_balle_adversaire_y < adversaire.y then
        adversaire.speed = speed_game*-1
      elseif contact_balle_adversaire_y > adversaire.y+adversaire.h then
        adversaire.speed = speed_game
      else
        adversaire.speed = 0
      end
    end
    
    if balle.wall_touch then
      adversaire.move = false
      adversaire.tps_react = 0.5
      balle.wall_touch = false
    end
    
    proximite = (balle.x-(adversaire.x+adversaire.w)) / largeur
    erreur = proximite*adversaire.err_factor
    adversaire.y = adversaire.y + adversaire.speed + love.math.random(-erreur, erreur)
  end
end

function love.draw()
  for i=1,#murs do
    local mur = murs[i]
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", mur.x, mur.y, mur.w, mur.h)
    love.graphics.setColor(1, 1, 1)
  end
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
  love.graphics.setColor(1, 1, 1)
  
  if type(contact_balle_adversaire_y)=="number" then
    love.graphics.setColor(0, 1, 0)
    love.graphics.line(balle.x, balle.y, contact_balle_adversaire_x, contact_balle_adversaire_y)
    love.graphics.setColor(1, 1, 1)
  end
  
  love.graphics.rectangle("fill", adversaire.x, adversaire.y, adversaire.w, adversaire.h)
end