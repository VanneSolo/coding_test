local assets_manager = {
  images = {},
  sounds = {},
  musics = {},
  fonts = {},
  videos = {},
  objects = {},
  game_objects = {}
}

function assets_manager:Add_Object(ID, new_object)
  self.objects[ID] = new_object
  table.insert(self.game_objects, new_object)
end

function assets_manager:Get_Object(ID)
  return self.objects[ID]
end

function assets_manager:Get_Objects()
  return self.game_objects
end

function assets_manager:Load_Image(ID, path)
  self.images[ID] = path --LG.newImage(path)
end

function assets_manager:Get_Image(ID)
  return self.images[ID]
end

function assets_manager:Load_Sound(ID, path)
  self.sounds[ID] = LA.newSource(path, "static")
end

function assets_manager:Get_Sound(ID)
  return self.sounds[ID]
end

function assets_manager:Load_Music(ID, path)
  self.musics[ID] = LA.newSource(path, "stream")
end

function assets_manager:Get_Music(ID)
  return self.musics[ID]
end

function assets_manager:Load_Font(ID, path, size)
  self.fonts[ID] = LG.newFont(path, size or 12)
end

function assets_manager:Get_Font(ID)
  return self.fonts[ID]
end

function assets_manager:Load_Video(ID, path)
  self.videos[ID] = LG.newVideo(path)
end

function assets_manager:Get_Video(ID)
  return self.videos[ID]
end

return assets_manager