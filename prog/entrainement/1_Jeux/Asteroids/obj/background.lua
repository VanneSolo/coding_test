local background = {
  transform = New_Object_Transform(0, 0, 0, 0, 0, 2, 2)
}

function background:Load()
  self.size = Vector(background_img:getWidth(), background_img:getHeight())
  self:Scale()
end

function background:Scale()
  self.transform.scale = Vector((game.fenetre.size.x > self.size.x) and (game.fenetre.size.x/self.size.x) or (self.size.x/game.fenetre.size.x),
                                (game.fenetre.size.y > self.size.y) and (game.fenetre.size.y/self.size.y) or (self.size.y/game.fenetre.size.y))
end

function background:Set_Scale(x, y)
  background.transform.scale = Vector(x, y)
end

function background:Update(dt)
end

function background:Draw()
  LG.draw(background_img,
          self.transform.move.x,
          self.transform.move.y,
          0,
          self.transform.scale.x,
          self.transform.scale.y)
end

function background:Debug()
  
end

return background