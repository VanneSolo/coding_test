function love.load()
  console = require "console"
  
  console.Init(30, 25, 25)
  console.Write_Line("BONJOUR, ")
  console.Write_Line("TU PUES LA MERDE A CHIER")
end

function love.update(dt)
  
end

function love.draw()
  console.Draw()
end

function love.keypressed(key)
  if key == "space" then
    console.Write_Line(tostring(os.time()))
  end
end