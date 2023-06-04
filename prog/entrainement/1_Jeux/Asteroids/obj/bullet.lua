local bullet = {
    weapon = {
      bullets = {}
	}
}

function bullet:Load()
  
end
  
function bullet:Create()
  tir_sound:stop()
  tir_sound:play()
  return {
    velocite = {force=Vector(0, 0), acceleration = 300},
    transform = New_Object_Transform(0, 0, 0, 0, 0, 2, 2),
    duree_vie = 1.5,
  }
end

function bullet:Update(dt)  
  for i=#self.weapon.bullets,1,-1 do
    self.weapon.bullets[i].transform.move.Add_To(Mul(self.weapon.bullets[i].velocite.force, dt))
    
    Wrap_Around(self.weapon.bullets[i])
    
    self.weapon.bullets[i].duree_vie = self.weapon.bullets[i].duree_vie - 1 * dt
    if self.weapon.bullets[i].duree_vie < 0 then
      table.remove(self.weapon.bullets, i)
    end
  end
end

function bullet:Draw()
  for _,v in pairs(self.weapon.bullets) do
    local img = game.assets_manager:Get_Image("img_"..v.ID)
    LG.draw(img,
            v.transform.move.x,
            v.transform.move.y,
            v.transform.rotation.x,
            v.transform.scale.x,
            v.transform.scale.y,
            img:getWidth()/2, img:getHeight()/2)
    --LG.circle("fill", )
  end
end

function bullet:Debug()
  LG.print("Nb bullets: "..tostring(#self.weapon.bullets), 5, 5+16*3)
end
	  
return bullet