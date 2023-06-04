io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

--### FONCTIONS USINES ###

--Chargement des images de l'explosion.
  
function Create_Explosion()
  local boum = {}
  boum.x = 50
  boum.y = 170
  boum.lst_explosions = {}
  for i=1,4 do
    local img = love.graphics.newImage("img_jam/explosion_"..i..".png")
    table.insert(boum.lst_explosions, img)
  end
  boum.current_img = 1
  return boum
end

--Creation des munitions du joueur.
function Cree_Bullet()
  local bullet = {}
  bullet.img = love.graphics.newImage("img_jam/bullet.png")
  bullet.x = player.x + player.w/2 + 10
  bullet.y = player.y + 70
  bullet.w = 5
  bullet.h = 20
  table.insert(lst_bullets, bullet)
end

--Creation des munitions des ennemis.
function Cree_Soldat_Bullet(soldat)
  local bullet = {}
  bullet.img = love.graphics.newImage("img_jam/bullet.png")
  bullet.x = soldat.x
  bullet.y = soldat.y + 70
  bullet.w = 5
  bullet.h = 20
  bullet.r = math.rad(180)
  table.insert(lst_tirs_soldat, bullet)
end

--Creations des ennemis.
function Cree_Soldat()
  local soldat = {}
  soldat.img = love.graphics.newImage("img_jam/soldat1.png")
  soldat.x = 25
  soldat.y = 230
  soldat.vx = 50
  soldat.w = soldat.img:getWidth()
  soldat.h = soldat.img:getHeight()
  soldat.r = 0
  soldat.headshot = false
  soldat.head = {x=soldat.x-15, y=soldat.y+5, w=soldat.x+10, h=30}
  soldat.depop = 1
  soldat.timer_pause = 2
  soldat.timer_tir = 0.1
  soldat.rafale = 0
  table.insert(lst_soldats, soldat)
end

--### UPDATE ET DRAW DU MENU ###

function Update_Menu(dt)
  
end

function Draw_Menu()
  love.graphics.draw(menu, 0, 0)
end

--### FIN UPDATE ET DRAW DU MENU ###

--### UPDATE ET DRAW SCENE VICTOIRE ###

function Update_Victoire(dt)
  timer_hero = timer_hero - dt
  if timer_hero <= 0 then
    timer_hero = 0
    hero.x = hero.x - 70*dt
    bombe.x = bombe.x - 70*dt
    if hero.x <= 350 then
      hero.x = 350
      bombe.x = hero.x-15
      hero.pose_bombe = true
    end
  end
  if hero.pose_bombe then
    timer_recul = timer_recul - dt
    if timer_recul <= 0 then
      timer_recul = 0
      bombe.x = 335
      hero.x = hero.x + 140*dt
      if hero.x >= 800 then
        hero.x = 800
        hero.off_screen = true
      end
    end
  end
  if hero.off_screen then
    boum.current_img = boum.current_img + 12*dt
    if boum.current_img > 4.9 then
      boum.current_img = 1
    end
    key_victory_screen = true
    win_text.y = win_text.y + 25*dt
    if win_text.y >= 10 then
      win_text.y = 10
    end
    text_infos.x = text_infos.x - 25*dt
    if text_infos.x <= 800-150 then
      text_infos.x = 800-150
    end
  end
end

function Draw_Victoire(dt)
  love.graphics.draw(fond_win, 0, 0)
  love.graphics.draw(usine, 10, 320)
  love.graphics.draw(usine, 260, 320)
  love.graphics.draw(citerne, 20, 140)
  love.graphics.draw(citerne, 210, 140)
  love.graphics.draw(bombe.img, bombe.x, bombe.y)
  love.graphics.draw(hero.img, hero.x, hero.y)
  if hero.off_screen then
    local img = math.floor(boum.current_img)
    love.graphics.draw(boum.lst_explosions[img], boum.x+15, boum.y-10)
    love.graphics.draw(boum.lst_explosions[img], -170, 80)
  end
  
  love.graphics.draw(win_text.img, win_text.x, win_text.y)
  love.graphics.draw(text_infos.img, text_infos.x, text_infos.y)
end

--### FIN UPDATE ET DRAW SCENE VICTOIRE ###

--### UPDATE ET DRAW SCENE DEFAITE ###

function Update_Defaite(dt)
  chrono_defaite_text = chrono_defaite_text - dt
  if chrono_defaite_text <= 0 then
    chrono_defaite_text = 0
    text_defaite.x = text_defaite.x + 50*dt
    if text_defaite.x >= 350/2 then
      text_defaite.x = 350/2
    end
    text_infos.y = text_infos.y - 50*dt
    if text_infos.y <= 600-230 then
      text_infos.y = 600-230
    end
  end
end

function Draw_Defaite()
  love.graphics.draw(fond_defaite, 0, 0)
  
  love.graphics.draw(text_defaite.img, text_defaite.x, text_defaite.y)
  love.graphics.draw(text_infos.img, text_infos.x, text_infos.y)
end

--### FIN UPDATE ET DRAW SCENE DEFAITE ###

--### UPDATE ET DRAW DU JEU ###

function Update_Game(dt)
  --Ecoulement du temps avant la victoire.
  timer_niveau = timer_niveau - dt
  if timer_niveau <= 0 then
    timer_niveau = 0
    current_scene = "VICTOIRE"
    text_infos.x = 800
    text_infos.y = 150
  end
  
  --Récupération de la position du curseur et maj de la position du joueur et de sa hitbox.
  mouse_x = love.mouse.getX()
  player.x = mouse_x - player.w/2
  bras_g.x = player.x-80
  if player.x + player.w >= largeur then
    player.x = largeur - player.w
    bras_g.x = player.x-80
  elseif player.x <= 80 then
    player.x = 80
    bras_g.x = player.x-80
  end
  player.hitbox = {x=player.x+20, y=player.y+100, w=player.w-40, h=165}
  
  --Rotation du bras gauche et lancé de la grenade.
  if bras_g.tourne then
    bras_g.r = bras_g.r + 0.1
    if bras_g.r >= math.rad(90) then
      bras_g.r = 0
      bras_g.tourne = false
    end
  end
  --Maj de la position de la grenade.
  grenade.x = bras_g.x+45
  --grenade.y = bras_g.y+15
  if grenade.launch then
    grenade.y = grenade.y - 50*dt
  end
  
  --Maj de la position des balles du joueur, verification des collisions avec les soldats adverses et suppression des tir s'ils sortent de l'écran.
  for i=#lst_bullets,1,-1 do
    local bullet = lst_bullets[i]
    bullet.y = bullet.y - 350*dt
    bullet.x = bullet.x + 120*dt
    for j=#lst_soldats,1,-1 do
      local soldat = lst_soldats[j]
      if bullet.x > soldat.head.x and bullet.x < soldat.x+soldat.head.w and bullet.y > soldat.head.y and bullet.y < soldat.y + soldat.head.h then
        soldat.headshot = true
        player.pv = player.pv + 0.25
      end
    end
    if bullet.y+bullet.h <= 0 then
      table.remove(lst_bullets, i)
    end
  end
  
  --Maj de la position des tirs des soldats, verification des collisions entre les balles des soldats et le joueur, suppressions des tirs des soldats qui sortent de l'écran.
  for i=#lst_tirs_soldat,1,-1 do
    local tir = lst_tirs_soldat[i]
    tir.y = tir.y + 200*dt
    if tir.y > player.hitbox.y and tir.x > player.hitbox.x and tir.x+tir.w < player.hitbox.x+player.hitbox.w then
      player.pv = player.pv - 1
      if player.pv <= 0 then
        current_scene = "DEFAITE"
        text_infos.x = 350
        text_infos.y = 620
      end
      table.remove(lst_tirs_soldat, i)
    end
    if tir.y >= hauteur then
      table.remove(lst_tirs_soldat, i)
    end
  end
  
  --Spawn des soldats.
  spawn_soldat = spawn_soldat - dt
  if spawn_soldat <= 0 then
    Cree_Soldat()
    spawn_soldat = 1
  end
  
  --Declenchement des tirs des soldats, maj de la position et suppression des soldats quand ils meurent et suppression des soldats qui sortent de l'écran.
  for i=#lst_soldats,1,-1 do
    local soldat = lst_soldats[i]
    soldat.x = soldat.x + soldat.vx*dt
    soldat.head.x = soldat.head.x + soldat.vx*dt
    soldat.timer_pause = soldat.timer_pause - dt
    if soldat.timer_pause <= 0 then
      soldat.timer_pause = 0
      soldat.timer_tir = soldat.timer_tir - dt
      if soldat.timer_tir <= 0 then
        Cree_Soldat_Bullet(soldat)
        soldat.rafale = soldat.rafale + 1
        soldat.timer_tir = 0.1
        if soldat.rafale == 10 then
          soldat.timer_tir = 0
          soldat.rafale = 0
          soldat.timer_pause = 2
        end
      end
    end
    if soldat.headshot then
      soldat.vx = 0
      soldat.r = math.rad(90)
      soldat.head.x = soldat.x + soldat.w+65
      soldat.head.y = soldat.y + soldat.h-15
      soldat.depop = soldat.depop - dt
      if soldat.depop <= 0 then
        soldat.depop = 0
        table.remove(lst_soldats, i)
      end
    end
    if soldat.x >= largeur then
      table.remove(lst_soldats, i)
    end
  end
end

function Draw_Game()
  --Affichage du fond.
  love.graphics.draw(fond_lvl_1.img, fond_lvl_1.x, fond_lvl_1.y)
  --Affichage des soldats.
  for i=#lst_soldats,1,-1 do
    local soldat = lst_soldats[i]
    love.graphics.draw(soldat.img, soldat.x, soldat.y+soldat.img:getHeight(), soldat.r, 1, 1, soldat.img:getWidth()/2, soldat.img:getHeight())
    if soldat.headshot then
      love.graphics.draw(sang, soldat.x+soldat.w+75, soldat.y+soldat.h)
    end
  end
  --Affichage des cahutes gauche et droite.
  love.graphics.draw(cahute_d, 700, 210)
  love.graphics.draw(cahute_g, 0, 220)
  --Affichage des tirs du joueur.
  for i=#lst_bullets,1,-1 do
    local bullet = lst_bullets[i]
    love.graphics.draw(bullet.img, bullet.x, bullet.y, math.pi/8)
  end
  
  --Affichage du joueur.
  love.graphics.draw(player.fusil, player.x, player.y)
  love.graphics.draw(bras_g.img, bras_g.x+80, bras_g.y+200, bras_g.r, 1, 1, 80, 200)
  love.graphics.draw(grenade.img, grenade.x, grenade.y)
  
  --Affichage des tirs des soldats.
  for i=#lst_tirs_soldat,1,-1 do
    local tir_soldat = lst_tirs_soldat[i]
    love.graphics.draw(tir_soldat.img, tir_soldat.x, tir_soldat.y, tir_soldat.r)
  end
  
  love.graphics.print("Vie: "..tostring(player.pv), 5, 5)
  love.graphics.print("Temps: "..tostring(math.floor(timer_niveau)), 200, 5)
end

--### FIN UPDATE ET DRAW DU JEU ###

--### LOAD ###


function love.load()
  love.window.setTitle("LaJamHaHaTo")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  --Chargement de l'image du menu.
  menu = love.graphics.newImage("img_jam/fond_menu.png")
  --Creation du joueur.
  vie = 1200
  player = {}
  player.fusil = love.graphics.newImage("img_jam/fusil.png")
  player.w = player.fusil:getWidth()
  player.h = player.fusil:getHeight()
  player.x = largeur/2 - player.w/2
  player.y = hauteur - player.h
  player.hitbox = {x=player.x+20, y=player.y+100, w=player.w-40, h=165}
  player.pv = vie
  
  --Settings du fond.
  fond_lvl_1 = {}
  fond_lvl_1.img = love.graphics.newImage("img_jam/fond_lvl_1.png")
  fond_lvl_1.x = 0
  fond_lvl_1.y = 0
  
  --Listes qui contiennent les balles du joueur, les soldats et les balles des soldats.
  lst_bullets = {}
  lst_soldats = {}
  lst_tirs_soldat = {}
  lst_sang = {}
  lst_sang2 = {}
  
  --Les différents timers.
  spawn_soldat = 1
  chrono = 50
  timer_niveau = chrono
  key_victory_screen = false
  
  --Image des tâches de sang.
  sang = love.graphics.newImage("img_jam/sang.png")
  
  current_scene = "MENU"
  
  --Image de fond en cas de défaite.
  fond_defaite = love.graphics.newImage("img_jam/fond_lose.png")
  text_defaite = {}
  text_defaite.img = love.graphics.newImage("img_jam/defaite_text.png")
  text_defaite.x = -500
  text_defaite.y = 225
  
  chrono_defaite_text = 3
  
  --Chargement des images de la scène de victoire.
  fond_win = love.graphics.newImage("img_jam/fond_win.png")
  citerne = love.graphics.newImage("img_jam/citerne.png")
  usine = love.graphics.newImage("img_jam/usine.png")
  
  hero = {}
  hero.img = love.graphics.newImage("img_jam/bonhomme_win.png")
  hero.x = 850
  hero.y = 330
  timer_hero = 1
  timer_recul = 1
  hero.pose_bombe = false
  hero.off_screen = false
  
  bombe = {}
  bombe.img = love.graphics.newImage("img_jam/bombe.png")
  bombe.x = hero.x - 15
  bombe.y = hero.y + 25
  
  boum = Create_Explosion()
  win_text = {}
  win_text.img = love.graphics.newImage("img_jam/win_text.png")
  win_text.x = 350/2
  win_text.y = -150
  
  text_infos = {}
  text_infos.img = love.graphics.newImage("img_jam/text_info.png")
  text_infos.x = 800
  text_infos.y = 0
  
  cahute_d = love.graphics.newImage("img_jam/cahute_d.png")
  cahute_g = love.graphics.newImage("img_jam/cahute_g.png")
  
  bras_g = {}
  bras_g.img = love.graphics.newImage("img_jam/bras_gauche.png")
  bras_g.x = player.x-80
  bras_g.y = 400
  bras_g.tourne = false
  bras_g.r = 0
  
  grenade = {}
  grenade.img = love.graphics.newImage("img_jam/grenade.png")
  grenade.x = bras_g.x+45
  grenade.y = bras_g.y+15
  grenade.launch = false
end


--### UPDATE ###


function love.update(dt)
  if current_scene == "MENU" then
    Update_Menu(dt)
  elseif current_scene == "GAME" then
    Update_Game(dt)
  elseif current_scene == "VICTOIRE" then
    Update_Victoire(dt)
  elseif current_scene == "DEFAITE" then
    Update_Defaite(dt)
  end
end


--### DRAW ###


function love.draw()
  if current_scene == "MENU" then
    Draw_Menu()
  elseif current_scene == "GAME" then
    Draw_Game()
  elseif current_scene == "VICTOIRE" then
    Draw_Victoire()
  elseif current_scene == "DEFAITE" then
    Draw_Defaite()
  end
end


--### KEYPRESSED ###


function love.keypressed(key)
  if current_scene == "MENU" then
    if key == "space" then
      player.pv = vie
      
      current_scene = "GAME"
      lst_bullets = {}
      lst_soldats = {}
      lst_tirs_soldat = {}
      
      spawn_soldat = 1
      timer_niveau = chrono
      
      hero.x = 850
      hero.y = 330
      timer_hero = 1
      timer_recul = 1
      hero.pose_bombe = false
      hero.off_screen = false
      bombe.x = hero.x - 15
      bombe.y = hero.y + 25
      
      text_defaite.x = -500
      text_defaite.y = 225
  
      key_victory_screen = false
      
      chrono_defaite_text = 3
      win_text.y = -150
      text_infos.x = 800
      text_infos.y = 0
    elseif key == "escape" then
      love.event.quit()
    end
  elseif current_scene == "VICTOIRE" then
    if key_victory_screen then
      if key == "m" then
        current_scene = "MENU"
      elseif key == "space" then
        current_scene = "GAME"
        player.pv = vie
        
        lst_bullets = {}
        lst_soldats = {}
        lst_tirs_soldat = {}
        
        spawn_soldat = 1
        timer_niveau = chrono
        
        hero.x = 850
        hero.y = 330
        timer_hero = 1
        timer_recul = 1
        hero.pose_bombe = false
        hero.off_screen = false
        bombe.x = hero.x - 15
        bombe.y = hero.y + 25
        
        text_defaite.x = -500
        text_defaite.y = 225
  
        key_victory_screen = false
        
        chrono_defaite_text = 3
        win_text.y = -150
        text_infos.x = 800
        text_infos.y = 0
      elseif key == "escape" then
        love.event.quit()
      end
    end
  elseif current_scene == "DEFAITE" then
    if key == "m" then
      current_scene = "MENU"
    elseif key == "space" then
      current_scene = "GAME"
      player.pv = vie
      
      lst_bullets = {}
      lst_soldats = {}
      lst_tirs_soldat = {}
      
      spawn_soldat = 1
      timer_niveau = chrono
      
      hero.x = 850
      hero.y = 330
      timer_hero = 1
      timer_recul = 1
      hero.pose_bombe = false
      hero.off_screen = false
      bombe.x = hero.x - 15
      bombe.y = hero.y + 25
      
      text_defaite.x = -500
      text_defaite.y = 225
  
      key_victory_screen = false
      
      chrono_defaite_text = 3
      win_text.y = -150
      text_infos.x = 800
      text_infos.y = 0
    elseif key == "escape" then
      love.event.quit()
    end
  end
end


--### MOUSEPRESSED ###


function love.mousepressed(x, y, button)
  local mouse_x = love.mouse.getX()
--Création des tirs du joueur.
  if button == 1 then
    Cree_Bullet()
  elseif button == 2 then
    bras_g.tourne = true
    grenade.launch = true
  end
end