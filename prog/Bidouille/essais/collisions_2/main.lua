io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "oop"
require "vector_2"

function love.load()
  love.window.setMode(900, 600)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  largeur_game_zone = 450
  
  world = love.physics.newWorld(0, 0, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  text = ""
  persisting = 0
  
  objects = {}
  
  objects.top_wall = {}
  objects.top_wall.body = love.physics.newBody(world, largeur_game_zone/2, 25, "static")
  objects.top_wall.shape = love.physics.newRectangleShape(largeur_game_zone, 50)
  objects.top_wall.fixture = love.physics.newFixture(objects.top_wall.body, objects.top_wall.shape)
  objects.top_wall.fixture:setUserData("top_wall")
  
  objects.left_wall = {}
  objects.left_wall.body = love.physics.newBody(world, 25, hauteur/2, "static")
  objects.left_wall.shape = love.physics.newRectangleShape(50, 500)
  objects.left_wall.fixture = love.physics.newFixture(objects.left_wall.body, objects.left_wall.shape)
  objects.left_wall.fixture:setUserData("left_wall")
  
  objects.right_wall = {}
  objects.right_wall.body = love.physics.newBody(world, largeur_game_zone-25, hauteur/2, "static")
  objects.right_wall.shape = love.physics.newRectangleShape(50, 500)
  objects.right_wall.fixture = love.physics.newFixture(objects.right_wall.body, objects.right_wall.shape)
  objects.right_wall.fixture:setUserData("right_wall")
  
  objects.down_wall = {}
  objects.down_wall.body = love.physics.newBody(world, largeur_game_zone/2, hauteur-25, "static")
  objects.down_wall.shape = love.physics.newRectangleShape(largeur_game_zone, 50)
  objects.down_wall.fixture = love.physics.newFixture(objects.down_wall.body, objects.down_wall.shape)
  objects.down_wall.fixture:setUserData("down_wall")
  
  objects.ball = {}
  objects.ball.body = love.physics.newBody(world, largeur_game_zone/2, hauteur/2, "dynamic")
  objects.ball.shape = love.physics.newCircleShape(20)
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
  objects.ball.fixture:setRestitution(0.5)
  objects.ball.fixture:setUserData("ball")
  
  objects.ball_k = {}
  objects.ball_k.body = love.physics.newBody(world, 350, hauteur/2, "kinematic")
  objects.ball_k.shape = love.physics.newCircleShape(20)
  objects.ball_k.fixture = love.physics.newFixture(objects.ball_k.body, objects.ball_k.shape)
  --objects.ball_k.fixture:setRestitution(0.5)
  objects.ball_k.fixture:setUserData("ball_k")
end

function love.update(dt)
  world:update(dt)
  
  if love.keyboard.isDown("up") then
    objects.ball.body:applyForce(0, -400)
  end
  if love.keyboard.isDown("right") then
    objects.ball.body:applyForce(400, 0)
  end
  if love.keyboard.isDown("down") then
    objects.ball.body:applyForce(0, 400)
  end
  if love.keyboard.isDown("left") then
    objects.ball.body:applyForce(-400, 0)
  end
  
  ball_k_pos_y = objects.ball_k.body:getY()
  speed = -10
  
  if ball_k_pos_y >= 500 or ball_k_pos_y <= 100 then
    speed = speed * -1
  end
  
  objects.ball_k.body:setY(ball_k_pos_y + speed)
  print(ball_k_pos_y)
  print(speed)
  
  if string.len(text) > 768 then
    text = ""
  end
  
end

function love.draw()
  love.graphics.polygon("line", objects.top_wall.body:getWorldPoints(objects.top_wall.shape:getPoints()))
  love.graphics.polygon("line", objects.left_wall.body:getWorldPoints(objects.left_wall.shape:getPoints()))
  love.graphics.polygon("line", objects.right_wall.body:getWorldPoints(objects.right_wall.shape:getPoints()))
  love.graphics.polygon("line", objects.down_wall.body:getWorldPoints(objects.down_wall.shape:getPoints()))
  
  love.graphics.circle("line", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  love.graphics.circle("line", objects.ball_k.body:getX(), objects.ball_k.body:getY(), objects.ball_k.shape:getRadius())
  
  love.graphics.print(text, 500, 10)
end

function beginContact(a, b, coll)
  x, y = coll:getNormal()
  text = text.."\n"..a:getUserData().." collides with: "..b:getUserData().." with a vector normal of: "..x..", "..y
end

function endContact(a, b, coll)
  persisting = 0
  text = text.."\n"..a:getUserData().." uncollides with: "..b:getUserData()
end

function preSolve(a, b, coll)
  if persisting == 0 then
    text = text.."\n"..a:getUserData().." is touching: "..b:getUserData()
  elseif persisting < 20 then
    text = text.." "..persisting
  end
  
  persisting = persisting + 1
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
  
end