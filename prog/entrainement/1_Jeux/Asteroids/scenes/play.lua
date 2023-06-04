local scene_play = {}

function scene_play:Load()
  vdo_menu:getSource():stop()
  game_music:play()
  
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Load()
  end
  
  asteroid_object.cailloux = {}
end

function scene_play:Update(dt)
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Update(dt)
  end
  
  Collider_Astres_Bullets_Plane(dt)
  
  game:Next_Level()
end

function scene_play:Draw()
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Draw()
  end
  
  game:Draw_Score()
  game:Draw_Lives()
  LG.print("FPS: "..tostring(LT.getFPS()), game.fenetre.size.x-140, 40)
  
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Debug()
  end
end

function scene_play:Resize(w, h)
  game.fenetre.size = Vector(w, h)
  
  background_object:Scale()
  plane_object:Center_Screen()
end

function scene_play:Keypressed(key)
  if key == "escape" then game:window_reset() end
  plane_object:Keypressed(key)
end

return scene_play