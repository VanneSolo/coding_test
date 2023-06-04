--[[

	Gestion des collisions de la balle avec les bords du terrain
	et avec les raquettes. Importer l'algo de collision cercle avec
	rectangle.

]]


-- Collision point contre rectangle.
function Point_Vs_Rect(px, py, rx, ry, rw, rh)
  if px > rx and px < rx+rw and py > ry and py < ry+rh then
    return true
  end
  return false
end

-- Résolution de collisions entre deux cercles.
function Resolve_Circle_Vs_Rect(dt, p_joueur, p_obstacle)
  local guessed_position = p_joueur.position + p_joueur.velocite*dt
  local current_position = p_joueur.position
  local target_position = guessed_position
  local nearest_point = Vector(0, 0)
  nearest_point.x = math.max(p_obstacle.position.x, math.min(guessed_position.x, p_obstacle.position.x+p_obstacle.size.x))
  nearest_point.y = math.max(p_obstacle.position.y, math.min(guessed_position.y, p_obstacle.position.y+p_obstacle.size.y))
  local ray_to_nearest = nearest_point - guessed_position
  local magnitude = ray_to_nearest.Get_Norme()
  local overlap = p_joueur.rayon-magnitude
  if type(overlap) ~= "number" then
    overlap = 0
  end
  if overlap > 0 then
    ray_to_nearest.normalize()
    guessed_position = guessed_position - ray_to_nearest*overlap
  end
  p_joueur.position = guessed_position
end

-- Inversion de la vélocité d'un sprite circulaire (p_joueur) s'il entre en collision
-- avec un sprite rectangulaire.
function Invert_Velocity(p_joueur, p_rect)
  if p_joueur.position.x > p_rect.position.x and p_joueur.position.x < p_rect.position.x+p_rect.size.x then
    p_joueur.velocite.y = -p_joueur.velocite.y
  else
    p_joueur.velocite.x = -p_joueur.velocite.x
  end
end


--[[-- Fonctions qui vérifié les collisions entre deux bounding boxes.
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

-- On vérifie si la balle entre en collision avec la raquette du joueur ou de l'IA.
touche_balle_joueur = CheckCollision(balle.x, balle.y, balle.w, balle.h, joueur.x, joueur.y, joueur.w, joueur.h)
touche_balle_ennemi = CheckCollision(balle.x, balle.y, balle.w, balle.h, ennemi.x, ennemi.y, ennemi.w, ennemi.h)
-- S'il y a contact, on inverse la vitesse en x ou en  de la balle selon le côté de la raquette qu'elle a touché.
if touche_balle_joueur then
	if balle.x > joueur.x+joueur.w/2 and balle.sy > 0 then
		balle.y = joueur.y-balle.h
		balle.sy = -balle.sy
	elseif balle.x > joueur.x+joueur.w/2 and balle.sy < 0 then
		balle.y = joueur.y+joueur.h
		balle.sy = -balle.sy
	elseif balle.y > joueur.y and balle.y+balle.h < joueur.y+joueur.h and balle.x+balle.w > joueur.x then
		balle.x = joueur.x-balle.w
		balle.sx = -balle.sx
	end
end

if touche_balle_ennemi then
	if balle.x < ennemi.x+ennemi.w/2 and balle.sy > 0 then
		balle.y = ennemi.y-balle.h
		balle.sy = -balle.sy
	elseif balle.x < ennemi.x+ennemi.w/2 and balle.sy < 0 then
		balle.y = ennemi.y+ennemi.h
		balle.sy = -balle.sy
	elseif balle.y > ennemi.y and balle.y+balle.h < ennemi.y+ennemi.h and balle.x < ennemi.x+ennemi.w then
		balle.x = ennemi.x+ennemi.w
		balle.sx = -balle.sx
	end
end]]