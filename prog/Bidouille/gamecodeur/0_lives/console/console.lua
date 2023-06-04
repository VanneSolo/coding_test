local Console = {}

Console.line = 0
Console.coll = 0
Console.grille = nil

Console.cursor = {}
Console.cursor.line = 1
Console.cursor.coll = 1

function Console.Init(pLine, pColl, pHeightPixel)
  Console.line = pLine
  Console.coll = pColl
  
  Console.font = love.graphics.newFont("04B_03B_.TTF", pHeightPixel, "none")
  love.graphics.setFont(Console.font)
  Console.char_width = Console.font:getWidth("W")
  Console.char_height = Console.font:getHeight("W")
  
  love.window.setMode(pColl*Console.char_width, pLine*Console.char_height)
  
  Console.canvas = love.graphics.newCanvas(pColl*Console.char_width, pLine*Console.char_height)
  Console.grille = {}
  for l=1,pLine do
    Console.Clear_Line(l)
  end
  
  Console.Update_Canvas()
end

function Console.Write_Line(pTexte)
  local n = 1
  for c=Console.cursor.coll,Console.cursor.coll+string.len(pTexte) do
    local char = string.sub(pTexte, n, n)
    Console.grille[Console.cursor.line][c] = char
    n = n + 1
  end
  Console.Next_Line()
  Console.Update_Canvas()
end

function Console.Next_Line()
  Console.cursor.line = Console.cursor.line + 1
  Console.cursor.coll = 1
  if Console.cursor.line > Console.line then
    Console.Scroll()
    Console.cursor.line = Console.line
  end
end

function Console.Clear_Line(pLine)
  Console.grille[pLine] = {}
  for c=1,Console.coll do
    Console.grille[pLine][c] = " "
  end
end

function Console.Scroll()
  for l=2,Console.line do
    Console.grille[l-1] = Console.grille[l]
  end
  Console.Clear_Line(Console.line)
  Console.Update_Canvas()
  if Console.cursor.line > 1 then
    Console.cursor.line = Console.cursor.line - 1
  end
end

function Console.Update_Canvas()
  love.graphics.setCanvas(Console.canvas)
  love.graphics.clear()
  love.graphics.setColor(1, 1, 1)
  for l=1,Console.line do
    for c=1,Console.coll do
      local offset = Console.char_width - Console.font:getWidth(Console.grille[l][c])
      love.graphics.print(Console.grille[l][c], ((c-1)*Console.char_width)+offset, (l-1)*Console.char_height)
    end
  end
  love.graphics.setCanvas()
end

function Console.Draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(Console.canvas)
  love.graphics.rectangle("fill", (Console.cursor.coll-1)*Console.char_width, (Console.cursor.line-1)*Console.char_height, Console.char_width, Console.char_height)
end

return Console