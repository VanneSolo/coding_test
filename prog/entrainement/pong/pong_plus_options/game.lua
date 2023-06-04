player = {}

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
love.graphics.setPointSize(4)

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

spawn_point = {}
spawn_point[1] = {x = largeur/2, y = 25}
spawn_point[2] = {x = largeur/2, y = hauteur/2}
spawn_point[3] = {x = largeur/2, y = hauteur-25}

rnd_spawn = love.math.random(1, 3)
rnd_adv_change_dir = 0
glob_vit_x = 2
glob_vit_y = 2
nb_pnt_victoire = 1

joueur = {}
joueur.w = 10
joueur.h = 50
joueur.x = largeur-30
joueur.y = hauteur/2-joueur.h/2

adv = {}
adv.w = 10
adv.h = 50
adv.x = 20
adv.y = hauteur/2-adv.h/2
adv.spd_y = glob_vit_y

balle = {}
balle.w = 6
balle.h = 6
balle.x = largeur/2-balle.w/2
balle.y = hauteur/2-balle.h/2
balle.spd_x = glob_vit_x
balle.spd_y = glob_vit_y

point_adv = 0
point_joueur = 0

function Balle_Spawn()
  if rnd_spawn == 1 then
    balle.x = spawn_point[1].x
    balle.y = spawn_point[1].y
  elseif rnd_spawn == 2 then
    balle.x = spawn_point[2].x
    balle.y = spawn_point[2].y
  else
    balle.x = spawn_point[3].x
    balle.y = spawn_point[3].y
  end
end

function Balle_Dir()
  if rnd_spawn == 1 then
    local dir_x = love.math.random(1, 2)
    if dir_x == 1 then
      balle.spd_x = glob_vit_x
      balle.spd_y = glob_vit_y
    else
      balle.spd_x = -glob_vit_x
      balle.spd_y = glob_vit_y
    end
  elseif rnd_spawn == 2 then
    local dir = love.math.random(1, 4)
    if dir == 1 then
      balle.spd_x = glob_vit_x
      balle.spd_y = glob_vit_y
    elseif dir == 2 then
      balle.spd_x = -glob_vit_x
      balle.spd_y = glob_vit_y
    elseif dir == 3 then
      balle.spd_x = glob_vit_x
      balle.spd_y = -glob_vit_y
    else
      balle.spd_x = -glob_vit_x
      balle.spd_y = -glob_vit_y
    end
  else
    local dir_x = love.math.random(1, 2)
    if dir_x == 1 then
      balle.spd_x = glob_vit_x
      balle.spd_y = -glob_vit_y
    else
      balle.spd_x = -glob_vit_x
      balle.spd_y = -glob_vit_y
    end
  end
end

function Balle_Bounce()
  if balle.y <= 0 or balle.y >= hauteur-balle.h then
    balle.spd_y = -balle.spd_y
  end
end

function Balle_Disp()
  balle.x = balle.x + balle.spd_x
  balle.y = balle.y + balle.spd_y
end

function Balle_Out()
  if balle.x <= 0 then
    point_joueur = point_joueur + 1
    if point_joueur == nb_pnt_victoire then
      current_scene = "VICTOIRE"
      in_game = false
      victoire = true
      point_adv = 0
      point_joueur = 0
    end
  elseif balle.x >= largeur-balle.w then
    point_adv = point_adv + 1
    if point_adv == nb_pnt_victoire then
      current_scene = "DEFAITE"
      in_game = false
      defaite = true
      point_adv = 0
      point_joueur = 0
    end
  end

  if balle.x <= 0 or balle.x >= largeur-balle.w then
    rnd_spawn = love.math.random(1, 3)
    Balle_Spawn()
    Balle_Dir()
  end
end

function Update_Balle()
  Balle_Out()
  Balle_Bounce()
  Balle_Disp()
end

function Joueur_Move()
  if love.keyboard.isDown("up") then
    joueur.y = joueur.y - glob_vit_y
  end
  if love.keyboard.isDown("down") then
    joueur.y = joueur.y + glob_vit_y
  end
  
  if joueur.y <= 0 then
    joueur.y = 0
  end
  if joueur.y >= hauteur-joueur.h then
    joueur.y = hauteur-joueur.h
  end
end

function Adv_Move()
  rnd_adv_change_dir = love.math.random(1, 2)
  if balle.y+balle.h/2 > adv.y+adv.h and rnd_adv_change_dir == 1 then
    adv.spd_y = glob_vit_y
  end
  if balle.y+balle.h/2 < adv.y and rnd_adv_change_dir == 2 then
    adv.spd_y = -glob_vit_y
  end
  
  adv.y = adv.y + adv.spd_y
  
  if adv.y <= 0 then
    adv.y = 0
  end
  if adv.y > hauteur-adv.h then
    adv.y = hauteur-adv.h
  end
end

function Collide_Balle()
  contact_balle_joueur = CheckCollision(balle.x, balle.y, balle.w, balle.h, joueur.x, joueur.y, joueur.w, joueur.h)
  contact_balle_adv = CheckCollision(balle.x, balle.y, balle.w, balle.h, adv.x, adv.y, adv.w, adv.h)
  
  if contact_balle_joueur then
    if balle.spd_y < 0 and balle.x+balle.w/2 > joueur.x then
      balle.y = joueur.y+joueur.h
      balle.spd_y = -balle.spd_y
    elseif balle.spd_y > 0 and balle.x+balle.w/2 > joueur.x then
      balle.y = joueur.y-balle.h
      balle.spd_y = -balle.spd_y
    else
      balle.x = joueur.x-balle.w
      balle.spd_x = -balle.spd_x
    end
  end
  
  if contact_balle_adv then
    if balle.spd_y < 0 and balle.x+balle.w/2 < adv.x+adv.w then
      balle.y = adv.y+adv.h
      balle.spd_y = -balle.spd_y
    elseif balle.spd_y > 0 and balle.x+balle.w/2 < adv.x+adv.w then
      balle.y = adv.y-adv.h
      balle.spd_y = -balle.spd_y
    else
      balle.x = adv.x+adv.w
      balle.spd_x = -balle.spd_x
    end
  end
end

function Game_Load()
  Balle_Spawn()
  Balle_Dir()
end

function Game_Update(dt)
  Joueur_Move()
  Update_Balle()
  Adv_Move()
  Collide_Balle()
end

function Game_Draw()
  love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.w, joueur.h)
  love.graphics.rectangle("fill", adv.x, adv.y, adv.w, adv.h)
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", balle.x, balle.y, balle.w, balle.h)
  love.graphics.setColor(1, 1, 1)
  for i=1,#spawn_point do
    love.graphics.points(spawn_point[i].x, spawn_point[i].y)
  end
  love.graphics.print(tostring(point_adv), 200, 10)
  love.graphics.print(tostring(point_joueur), 600, 10)
end