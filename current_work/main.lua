--[[
                                        USER INTERFACE
  
  -Débugger le reset des couleurs à (1, 1, 1)
  -Corriger le bug de position si on passe à la méthode Set_Shape un argument
   différent de celui passé à la création du bouton.
  -Corriger le bug d'affichage du texte dans un bouton rond.
  -Corriger les barres de progressions ronde.
  -Ajouter la possibilité de naviguer dans l'UI au clavier ou à la manette.
  -Faire les tests avec des images à la place des primitives de Löve2D.
  -Ecrire une documentation pour utiliser l'UI.

]]

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

require "vector"
require "solo_2d.maths.basics"
require "solo_2d.maths.bezier"
require "solo_2d.maths.tweening"
require "solo_2d.physics.detection"
require "solo_2d.physics.resolution"
require "solo_2d.physics.sat"
require "solo_2d.utilitaires.utils"
ui = require("user_interface.gui_base")

require "player"
require "alien"
require "bullet"
require "asteroid"
require "background"

inconsolata = love.graphics.newFont("Inconsolata-Medium.ttf")
saucer_sound = love.audio.newSource("sounds/saucer_sound.wav", "static")
music_1 = love.audio.newSource("sounds/05_03_2023.wav", "stream")

-- CREATION DU STARFIELD
starfield = {}
nb_stars = 100
star_trebble = 0.1
for i=1,nb_stars do
  local star = {}
  star.r = math.random(1, 3)
  star.x = math.random(star.r, largeur-star.r)
  star.y = math.random(star.r, hauteur-star.r)
  star.color = {math.random(0.8, 1), math.random(0.8, 1), math.random(0.8, 1), 1}
  table.insert(starfield, star)
end

-- INITIALISATION DU PLAYER
player = {}

-- INITIALISATION ET FONCTION DE CREATION DES BULLETS
bullets = {}
function Create_Bullet()
  local bullet = {}
  bullet.body = love.physics.newBody(world, player.body:getX()+player.img:getWidth()*math.cos(player.body:getAngle()), player.body:getY()+player.img:getWidth()*math.sin(player.body:getAngle()), "dynamic")
  bullet.body:isBullet(true)
  bullet.body:setUserData(bullet)
  bullet.shape = love.physics.newCircleShape(2)
  bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape, 1)
  bullet.fixture:setUserData(bullet)
  bullet.lifespan = 0.6
  bullet.snd = love.audio.newSource("player_shoot.wav", "stream")
  bullet.id  = "bullet"
  return bullet
end

-- CREATION D'UN ASTEROIDE
function Create_Asteroid()
  local asteroid = {}
  asteroid.body = love.physics.newBody(world, 200, 200, "dynamic")
  asteroid.body:setUserData(asteroid)
  asteroid.shape = love.physics.newCircleShape(30)
  asteroid.fixture = love.physics.newFixture(asteroid.body, asteroid.shape, 10)
  asteroid.fixture:setUserData(asteroid)
  asteroid.id = "asteroid"
  asteroid.pv = 4
  asteroid.nb_lives = 3
  asteroid.is_alive = true
  return asteroid
end

-- LOAD
function love.load()
  -- CREATION DU WORLD
  world = love.physics.newWorld(0, 0, true)
  world:setCallbacks(Begin_Contact, End_Contact, Pre_Solve, Post_Solve)
  
  -- DEFINITION DES PARAMETRES DU PLAYER
  player.body = love.physics.newBody(world, largeur/2, hauteur/2, "dynamic")
  player.body:setUserData(player)
  player.points = Create_1D_Table(Create_Regular_Polygon_Points(3, 25, 0))
  player.shape = love.physics.newPolygonShape(player.points)
  player.fixture = love.physics.newFixture(player.body, player.shape, 2)
  player.fixture:setUserData(player)
  player.sound = love.audio.newSource("sounds/player_ship_2.wav", "static")
  player.img = love.graphics.newImage("red_ship.png")
  player.speed = 0
  player.speed_max = 400
  player.id = "player"
  player.pv = 5
  player.nb_lives = 3
  
  -- CREATION D'UN ASTEROIDE
  asteroid = Create_Asteroid()
end

-- UPDATE
function love.update(dt)
  -- UPDATE DU WORLD
  world:update(dt)
  
  -- ROTATION DU PLAYER
  if love.keyboard.isDown("left") then
    player.body:setAngle(player.body:getAngle()-0.1)
  end
  if love.keyboard.isDown("right") then
    player.body:setAngle(player.body:getAngle()+0.1)
  end
  
  --UPDATE DE LA POSITION DU PLAYER EN PRENANT EN COMPTE LA ROTATION
  if love.keyboard.isDown("up") then
    player.speed = 20
    player.body:applyLinearImpulse(player.speed*math.cos(player.body:getAngle()), player.speed*math.sin(player.body:getAngle()))
    -- RECUPERATION DE LA VELOCITE DU PLAYER
    local x, y = player.body:getLinearVelocity()
    -- CAP DE LA VELOCITE QUAND X OU Y DEPASSE UNE CERTAINE VALEUR
    if x >= player.speed_max then
      player.body:setLinearVelocity(player.speed_max, y)
    end
    if x <= -player.speed_max then
      player.body:setLinearVelocity(-player.speed_max, y)
    end
    if y >= player.speed_max then
      player.body:setLinearVelocity(x, player.speed_max)
    end
    if y <= -player.speed_max then
      player.body:setLinearVelocity(x, -player.speed_max)
    end
    
    -- CAP DE LA VELOCITE QUAND X ET Y DEPASSENT UNE CERTAINE VALEUR
    if x >= player.speed_max and y >= player.speed_max then
      player.body:setLinearVelocity(player.speed_max, player.speed_max)
    end
    if x >= player.speed_max and y <= -player.speed_max then
      player.body:setLinearVelocity(player.speed_max, -player.speed_max)
    end
    if x <= -player.speed_max and y >= player.speed_max then
      player.body:setLinearVelocity(-player.speed_max, player.speed_max)
    end
    if x <= -player.speed_max and y <= -player.speed_max then
      player.body:setLinearVelocity(-player.speed_max, -player.speed_max)
    end
    
    -- SON DU MOTEUR DU PLAYER
    player.sound:play()
  else
    -- ARRET DU VAISSEAU SI ON LACHE LA TOUCHE UP
    player.speed = player.speed * 0.95
    if player.speed < 0.5 then
      player.speed = 0
    end
    local x, y = player.body:getLinearVelocity()
    player.body:setLinearVelocity(x*0.95, y*0.95)
    if x < 0.5 then
      x = 0
    end
    if y < 0.5 then
      y = 0
    end
  end
  
  -- COUPE LA ROTATION QUAND ON LACHE LA TOUCHE LEFT OU RIGHT POUR EVITER
  -- QUE LE VAISSEAU CONTINUE A TOURNER
  player.body:setAngularVelocity(0)
  
  -- REAPPARITION DU VAISSEAU S'IL SORT DE L'ECRAN
  if player.body:getX() > largeur then
    player.body:setX(0)
  elseif player.body:getX() < 0 then
    player.body:setX(largeur)
  end
  
  if player.body:getY() > hauteur then
    player.body:setY(0)
  elseif player.body:getY() < 0 then
    player.body:setY(hauteur)
  end
  
  -- UPDATE DE LA POSITION DES ETOILES EN FONCTION DU PLAYER ET REAPPARITION
  -- SI ELLES SORRTENT DE L'ECRAN
  for i=1,#starfield do
    starfield[i].x = starfield[i].x - player.speed*math.cos(player.body:getAngle())
    starfield[i].y = starfield[i].y - player.speed*math.sin(player.body:getAngle())
    if starfield[i].x > largeur then
      starfield[i].x = 0
    end
    if starfield[i].x < 0 then
      starfield[i].x = largeur
    end
    if starfield[i].y > hauteur then
      starfield[i].y = 0
    end
    if starfield[i].y < 0 then
      starfield[i].y = hauteur
    end
  end
  
  -- AJOUTE UN PETIT MOUVEMENT ALEATOIRE AUX ETOILES QUAND LE VAISSEAU NE BOUGE PAS
  
  for i=1,#starfield do
    pile_ou_face = love.math.random(1, 2)
    if pile_ou_face == 1 then
      star_trebble = -0.1
    elseif pile_ou_face == 2 then
      star_trebble = 0.1
    end
    starfield[i].x = starfield[i].x + star_trebble
    starfield[i].y = starfield[i].y + star_trebble
  end
  
  -- UPDATE DE LA POSITION DES BULLETS ET DE LEUR DUREE DE VIE, JOUE UN SON DE TIR
  -- GERE LEUR DESTRUCTION A LA FIN DE LEUR DUREE DE VIE
  for i=#bullets,1,-1 do
    bullets[i].snd:play()
    bullets[i].body:setAngle(player.body:getAngle())
    bullets[i].body:applyLinearImpulse(20*math.cos(bullets[i].body:getAngle()), 20*math.sin(bullets[i].body:getAngle()))
    bullets[i].lifespan = bullets[i].lifespan - 0.1
    if bullets[i].lifespan <= 0 then
      table.remove(bullets, i)
    end
  end
  
  -- DEPLACEMENT DE L'ASTEROIDE
  --asteroid.body:setLinearVelocity(-50, math.random(-10, 10))
  if asteroid.body:isDestroyed() == false then
    asteroid.body:setLinearVelocity(-50, -50)
    if asteroid.body:getX() > largeur+asteroid.shape:getRadius() then
      asteroid.body:setX(-asteroid.shape:getRadius())
    end
    if asteroid.body:getX() < -asteroid.shape:getRadius() then
      asteroid.body:setX(largeur+asteroid.shape:getRadius())
    end
    if asteroid.body:getY() > hauteur+asteroid.shape:getRadius() then
      asteroid.body:setY(-asteroid.shape:getRadius())
    end
    if asteroid.body:getY() < -asteroid.shape:getRadius() then
      asteroid.body:setY(hauteur+asteroid.shape:getRadius())
    end
    if asteroid.is_alive == false then
      asteroid.body:destroy()
    end
  end
end

-- DRAW
function love.draw()
  -- AFFICHAGE DU CHAMP D'ETOILES
  for i=1,#starfield do
    love.graphics.setColor(starfield[i].color)
    love.graphics.circle("fill", starfield[i].x, starfield[i].y, starfield[i].r)
  end
  -- AFFICHAGE DES BULLETS
  love.graphics.setColor(0, 1, 0, 1)
  for i=1,#bullets do
    love.graphics.circle("fill", bullets[i].body:getX(), bullets[i].body:getY(), bullets[i].shape:getRadius())
  end
  -- AFFICHAGE DU PLAYER
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(player.img, player.body:getX(), player.body:getY(), player.body:getAngle(), 1, 1, player.img:getWidth()/2-5, player.img:getHeight()/2)
  -- AFFICHAGE DE L'ASTEROIDE
  if asteroid.body:isDestroyed() == false then
    love.graphics.setColor(1, 0.33, 0.47)
    love.graphics.circle("fill", asteroid.body:getX(), asteroid.body:getY(), asteroid.shape:getRadius())
  end
  -- REMISE DE LA COULEUR PAR DEFAUT
  love.graphics.setColor(1, 1, 1, 1)
  
  love.graphics.print("vitesse du joueur: "..tostring(player.speed), 5, 5)
  love.graphics.print("pv asteroid en cours: "..tostring(asteroid.pv), 5, 5+16)
  love.graphics.print("nombre de vies asteroid: "..tostring(asteroid.nb_lives), 5, 5+16*2)
  love.graphics.print("statut de l'asteroid: "..tostring(asteroid.is_alive)..", is destroyed: "..tostring(asteroid.body:isDestroyed()), 5, 5+16*3)
end

-- MOUSEPRESSED
function love.mousepressed(x, y, button)
end

-- KEYPRESSED
function love.keypressed(key)
  -- CREATION DES TIRS
	if key == "space" then
    table.insert(bullets, Create_Bullet())
  end
end

-- PHYSICS CALLBACKS // ordre d'appel: begin, pre_solve et post_solve en alternance et en continu tout le temps que dure
--                                     la collision entre les deux objets et end à la fin.
function Begin_Contact(a, b, collision)
  --print(a:getBody():getUserData().id, b:getBody():getUserData().id)
  if a:getBody():getUserData().id == "asteroid" and b:getBody():getUserData().id == "bullet" or a:getBody():getUserData().id == "bullet" and b:getBody():getUserData().id == "asteroid" then
    if a:getBody():getUserData().id == "asteroid" then
      a:getBody():getUserData().pv = a:getBody():getUserData().pv - 1
      if a:getBody():getUserData().pv <= 0 then
        a:getBody():getUserData().pv = 4
        a:getBody():getUserData().nb_lives = a:getBody():getUserData().nb_lives - 1
      end
    elseif b:getBody():getUserData().id == "asteroid" then
      b:getBody():getUserData().pv = b:getBody():getUserData().pv - 1
      if b:getBody():getUserData().pv <= 0 then
        b:getBody():getUserData().pv = 4
        b:getBody():getUserData().nb_lives = b:getBody():getUserData().nb_lives - 1
      end
    end
  end
end

function End_Contact(a, b, collision)
  if a:getBody():isDestroyed() == false and a:getBody():getUserData().id == "asteroid" then
    if a:getBody():getUserData().nb_lives <= 0 then
      a:getBody():getUserData().is_alive = false
    end
  elseif b:getBody():isDestroyed() == false and b:getBody():getUserData().id == "asteroid" then
    if b:getBody():getUserData().nb_lives <= 0 then
      b:getBody():getUserData().is_alive = false
    end
  end
end

function Pre_Solve(a, b, collision)
  
end

function Post_Solve(a, b, collision, normal_impulse, tangent_impulse)
  
end