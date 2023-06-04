require "oop"
require "vector2"
require "polygon"
require "rectangle"

--[[function translate(collider,x,y)
    collider.mainPoint = collider.mainPoint + new "Vector2" (x,y)
    local n
    for n = 1,#collider.verticies do
      collider.verticies[n] = collider.verticies[n] + new "Vector2" (x,y)
    end

end]]

function love.load()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    Box1 = {}
    Box1.x = 100
    Box1.y = 100
    Box1.img = love.graphics.newImage("square.png")
    Box1.width = Box1.img:getWidth()
    Box1.height = Box1.img:getHeight()
    Box1.rotation = 0
    Box1.collider = new "Rectangle" (new"Vector2"(Box1.x,Box1.y),new"Vector2"(Box1.width,Box1.height))

    Box2 = {}
    Box2.x = screenWidth/2
    Box2.y = screenHeight/2
    Box2.img = love.graphics.newImage("square.png")
    Box2.width = Box2.img:getWidth()
    Box2.height = Box2.img:getHeight()
    Box2.rotation = 0
    Box2.collider = new "Rectangle" (new"Vector2"(Box2.x,Box2.y),new"Vector2"(Box2.width,Box2.height))

    collides = false
end

function love.update()
    local mX,mY = love.mouse.getPosition()
    Box1.collider = new "Rectangle" (new"Vector2"(mX,mY),new"Vector2"(Box1.width,Box1.height))
    Box1.x = mX
    Box1.y = mY

    collides = Box1.collider:collides(Box2.collider,Box1.rotation,Box2.rotation)
end

function love.draw()
    if collides == true then
        love.graphics.setColor(0,255,0,1)
    end
    love.graphics.draw(Box1.img,Box1.x,Box1.y,Box1.rotation,1,1,Box1.width/2,Box1.height/2)
    love.graphics.draw(Box2.img,Box2.x,Box2.y,Box2.rotation,1,1,Box2.width/2,Box2.height/2)
    love.graphics.setColor(255,255,255,1)
    love.graphics.print("use the mouse wheel to rotate the square or the up and down buttons",0,0,0,1,1,0,0)
end

function love.wheelmoved(x, y)
    local var = math.rad(3*y)
    Box1.rotation = Box1.rotation + var
end
function love.keypressed(key)
    if key == "up" then
        local var = math.rad(10)
        Box1.rotation = Box1.rotation + var
    end
    if key == "down" then
        local var = math.rad(-10)
        Box1.rotation = Box1.rotation + var
    end
end