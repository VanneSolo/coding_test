local GUI = {}

function newButton(pX,pY,pW,pH,pText)
  local myButton = {}
  myButton.X = pX
  myButton.Y = pY
  myButton.W = pW
  myButton.H = pH
  myButton.Visible = true
  
  function myButton:draw()
    if self.Visible == false then return end
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("line", self.X, self.Y, self.W, self.H)
  end
  
  function myButton:setVisible(pVisible)
    self.Visible = pVisible
  end
  
  return myButton
end

-- Version sans self
function DrawButton(pButton)
    if pButton.Visible == false then return end
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("line", pButton.X, pButton.Y, pButton.W, pButton.H)
end

function GUI:newGroup()
  local myGroup = {}
  myGroup.elements = {}
  
  function myGroup:addElement(pElement)
    table.insert(self.elements, pElement)
  end
  
  function myGroup:setVisible(pVisible)
    for n,v in pairs(myGroup.elements) do
      v:setVisible(pVisible)
    end
  end
  
  function myGroup:draw()
    for n,v in pairs(myGroup.elements) do
      v:draw()
      -- Version sans self :
      -- DrawButton(v)
    end
  end
    
  return myGroup
end

return GUI