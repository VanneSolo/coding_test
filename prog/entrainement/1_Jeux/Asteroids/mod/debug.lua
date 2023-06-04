local debugage = {
  state = false
}

function debugage:Load(etat)
  self.debugage = etat
end

function debugage:Update(dt)
  
end

function debugage:Draw(obj)
  if self.debugage then
    obj:Debugage()
  end
end

return debugage