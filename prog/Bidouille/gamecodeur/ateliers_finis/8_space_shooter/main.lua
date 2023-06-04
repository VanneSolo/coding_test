io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

hero = {}

math.randomseed(love.timer.getTime())

liste_sprites = {}
liste_tirs = {}
liste_aliens = {}

niveau = {}
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 })

camera = {}
camera.y = 0
camera.vitesse = 1

ecran_courant = "menu"

victoire = false
timer_victoire = 0

img_tiles = love.graphics.newImage("images/tile_space_shooter.png")

img_explosion = {}
for i = 1, 5 do
  img_explosion[i] = love.graphics.newImage("images/gros_boum_"..i..".png")
end

img_menu = love.graphics.newImage("images/menu_accueil.png")
img_victoire = love.graphics.newImage("images/menu_victoire.png")
img_defaite = love.graphics.newImage("images/menu_gameover.png")

--son_shoot
--son_explode

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

function Collide(a1, a2)
  if (a1 == a2) then return false end
  
  local dx = a1.x - a2.x
  local dy = a1.y - a2.y
  
  if (math.abs(dx) < a1.image:getWidth()/4 + a2.image:getWidth()/4) then
    if (math.abs(dy) < a1.image:getHeight()/4 + a2.image:getHeight()/4) then
      return true
    end
  end
  return false
end

function CreateShoot(pType, pNomImage, pX, pY, pVitesseX, pVitesseY)
  local tir = CreateSprite(pNomImage, pX, pY)
  tir.type = pType
  tir.vx = pVitesseX
  tir.vy = pVitesseY
  table.insert(liste_tirs, tir)
end

function CreateAlien(pType, pX, pY)
  local img_name = ""
  if pType == 1 then
    img_name = "vaisseau_rose_1"
  elseif pType == 2 then
    img_name = "vaisseau_rose_2"
  elseif pType == 3 then
    img_name = "tourelle"
  elseif pType == 10 then
    img_name = "vaisseau_rose_3"
  end
  
  local alien = CreateSprite(img_name, pX, pY)
  
  alien.type = pType
  alien.endormi = true
  alien.chrono_tir = 0
  
  if pType == 1 then
    alien.vx = 0
    alien.vy = 2
    alien.energy = 1
  elseif pType == 2 then
    local direction = math.random(1, 2)
    if direction == 1 then
      alien.vx = 1
    else
      alien.vx = -1
    end
    alien.vy = 2
    alien.energy = 3
  elseif pType == 3 then
    alien.vx = 0
    alien.vy = camera.vitesse
    alien.energy = 5
  elseif pType == 10 then
    alien.vx = 0
    alien.vy = camera.vitesse * 2
    alien.energy = 20
    alien.angle = 0
  end
  table.insert(liste_aliens, alien)
end

function CreateSprite(pNomImage, pX, pY)
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprime = false
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.largeur = sprite.image:getWidth()
  sprite.hauteur = sprite.image:getHeight()
  sprite.frame = 1
  sprite.liste_frames = {}
  sprite.max_frame = 1
  table.insert(liste_sprites, sprite)
  
  return sprite
end

function CreateExplosion(pX, pY)
  local new_explosion = CreateSprite("gros_boum_1", pX, pY)
  new_explosion.liste_frames = img_explosion
  new_explosion.max_frame = 5
end

function love.load()
  love.window.setMode(1024, 768)
  love.window.setTitle("Shooter")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  DemarreJeu()
end

function DemarreJeu()
  liste_aliens = {}
  liste_sprites = {}
  liste_tirs = {}
  
  hero = CreateSprite("vaisseau_rouge", largeur/2, hauteur/2)
  hero.x = largeur/2
  hero.y = hauteur - 72
  
  camera.y = 0
  
  ecran_courant = "menu"
  victoire = false
  timer_victoire = 0
  
  local ligne = 4
  CreateAlien(1, largeur/2, -(64/2)-(64*(ligne-1)))
  ligne = 10
  CreateAlien(2, largeur/2, -(64/2)-(64*(ligne-1)))
  ligne = 11
  CreateAlien(3, 3*64, -(64/2)-(64*(ligne-1)))
  
  ligne = #niveau
  CreateAlien(10, largeur/2, -(64/2)-(64*(ligne-1)))
  
  camera.y = 0
end

function UpdateJeu(dt)
  camera.y = camera.y + camera.vitesse * (60 * dt)
  
  local n
  for n = #liste_tirs, 1, -1 do
    local tir = liste_tirs[n]
    tir.x = tir.x + (tir.vx/2) * (60*dt)
    tir.y = tir.y + (tir.vy/2) * (60*dt)
    
    if tir.type == "alien" then
      if Collide(--[[hero, tir]]) then
        tir.supprime = true
        table.remove(liste_tirs, n)
        ecran_courant = "gameover"
      end
    end
    
    if tir.type == "vaisseau_rouge_hero" then
      local nAlien
      for nAlien = #liste_aliens, 1, -1 do
        local alien = liste_aliens[nAlien]
        if alien.endormi == false then
          if Collide(tir, alien) then
            CreateExplosion(tir.x, tir.y)
            tir.supprime = true
            table.remove(liste_tirs, n)
            alien.energy = alien.energy - 1
            if alien.energy <= 0 then
              local nExplosion
              for nExplosion = 1, 5 do
                CreateExplosion(alien.x+math.random(-10, 10), alien.y+math.random(-10, 10))
              end
              if alien.type == 10 then
                victoire = true
                timer_victoire = 200
                for nExplosion = 1, 20 do
                  CreateExplosion(alien.x+math.random(-100, 100), alien.y+math.random(-100, 100))
                end
              end
              alien.supprime = true
              table.remove(liste_aliens, nAlien)
            end
          end
        end
      end
    end
    
    if (tir.y<0 or tir.y > hauteur) and tir.supprime == false then
      tir.supprime = true
      table.remove(liste_tirs, n)
    end
  end
  
  for n=#liste_aliens, 1, -1 do
    local alien = liste_aliens[n]
    if alien.y > 0 then
      alien.endormi = false
    end
    
    if alien.endormi == false then
      alien.x = alien.x + alien.vx * (60*dt)
      alien.y = alien.y + alien.vy * (60*dt)
      if alien.type == 1 or alien.type == 2 then
        alien.chrono_tir = alien.chrono_tir - 1 * (60*dt)
        if alien.chrono_tir  <= 0 then
          alien.chrono_tir = math.random(60, 100)
          CreateShoot("alien", "laser_2", alien.x, alien.y, 0, 10)
        end
      elseif alien.type == 3 then
        alien.chrono_tir = alien.chrono_tir - 1 * 60*dt
        if alien.chrono_tir <= 0 then
          alien.chrono_tir = 40
          local vx, vy
          local angle
          angle = math.angle(alien.x, alien.y, hero.x, hero.y)
          vx = 10 * math.cos(angle)
          vy = 10 * math.sin(angle)
          CreateShoot("alien", "laser_2", alien.x, alien.y, vx, vy)
        end
      elseif alien.type == 10 then
        if alien.y > hauteur/3 then
          alien.y = hauteur/3
        end
        alien.chrono_tir = alien.chrono_tir - 1 * 60*dt
        if alien.chrono_tir <= 0 then
          alien.chrono_tir = 15
          local vx, vy
          alien.angle = alien.angle + 0.5
          vx = 10 * math.cos(alien.angle)
          vy = 10 * math.sin(alien.angle)
          CreateShoot("alien", "laser_2", alien.x, alien.y, vx, vy)
        end
      end
    else
      alien.y = alien.y + camera.vitesse * (60*dt)
    end
    if alien.y > hauteur then
      alien.supprime = true
      table.remove(liste_aliens, n)
    end
  end
  
  for n = #liste_sprites, 1, -1 do
    local sprite = liste_sprites[n]
    if sprite.max_frame > 1 then
      sprite.frame = sprite.frame + 0.2
      if math.floor(sprite.frame) > sprite.max_frame then
        sprite.supprime = true
      else
        sprite.image = sprite.liste_frames[math.floor(sprite.frame)]
      end
    end
    if sprite.supprime == true then
      table.remove(liste_sprites, n)
    end
  end
  
  if love.keyboard.isDown("up") and hero.y-72>=0 then
    hero.y = hero.y - 4 * (60*dt)
  end
  if love.keyboard.isDown("right") and hero.x+49<=largeur then
    hero.x = hero.x + 4 * (60*dt)
  end
  if love.keyboard.isDown("down") and hero.y+72<=hauteur then
    hero.y = hero.y + 4 * (60*dt)
  end
  if love.keyboard.isDown("left") and hero.x-49>=0 then
    hero.x = hero.x - 4 * (60*dt)
  end
  --print("hero.x: "..hero.x)
  --print("hero.y: "..hero.y)
  if victoire == true then
    timer_victoire = timer_victoire - 1
    if timer_victoire == 0 then
      ecran_courant = "victoire"
    end
  end
end

function UpdateMenu(dt)
end

function love.update(dt)
  if ecran_courant == "jeu" then
    UpdateJeu(dt)
  elseif ecran_courant == "menu" then
    UpdateMenu(dt)
  end
end

function DrawJeu()
  local nbLignes = #niveau
  local ligne, colonne
  local x, y
  
  x = 0
  y = 0-64 + camera.y
  for ligne = nbLignes, 1, -1 do
    for colonne = 1, 16 do
      local tile = niveau[ligne][colonne]
      if tile>0 and y > 0-64 and y<love.graphics.getHeight() then
        love.graphics.draw(img_tiles, x, y, 0, 2, 2)
        love.graphics.rectangle("line", x, y, img_tiles:getWidth()*2, img_tiles:getHeight()*2)
      end
      x = x+64
    end
    x = 0
    y = y-64
  end
  
  local n
  for n = 1, #liste_sprites do
    local s = liste_sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 0.5, 0.5, s.largeur/2, s.hauteur/2)
    --love.graphics.rectangle("line", s.x-(s.largeur/4), s.y-(s.hauteur/4), s.largeur/2, s.hauteur/2)
  end
    
  love.graphics.print("Nombre de tirs = "..#liste_tirs.." Nombre de sprites = "..#liste_sprites.." Nombre d'aliens = "..#liste_aliens.." FPS = "..love.timer.getFPS(),0,0)
end

function DrawMenu()
  love.graphics.draw(img_menu, 0, 0)
end

function DrawGameover()
  love.graphics.draw(img_defaite, 0, 0)
end

function DrawVictoire()
  love.graphics.draw(img_victoire, 0, 0)
end

function love.draw()
  if ecran_courant == "jeu" then
    DrawJeu()
  elseif ecran_courant == "menu" then
    DrawMenu()
  elseif ecran_courant == "gameover" then
    DrawGameover()
  elseif ecran_courant == "victoire" then
    DrawVictoire()
  end
end

function love.keypressed(key)
  if ecran_courant == "jeu" then
    if key == "space" then
      CreateShoot("vaisseau_rouge_hero", "laser_1", hero.x, hero.y-75, 0, -10)
    end
  elseif ecran_courant == "menu" then
    if key == "space" then
      ecran_courant = "jeu"
    end
  elseif ecran_courant == "gameover" then
    if key == "space" then
      DemarreJeu()
    end
  elseif ecran_courant == "victoire" then
    if key == "space" then
      ecran_courant = "menu"
    end
  end
end