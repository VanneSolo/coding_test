function Draw_Options()
  love.graphics.print("Bienvenue dans les options", 10, 10)
  love.graphics.print("Choisissez ce que vous voulez faire:", 10, 10+16)
  love.graphics.print("Orientation du terrain de jeu: HORIZONTAL / VERTICAL", 10, 10+16*2)
  love.graphics.print("Niveau de difficulté: 1 / 2 / 3", 10, 10+16*3)
  love.graphics.print("Volume des effets sonores: 0 / 1 / 2 / 3", 10, 10+16*4)
  love.graphics.print("Volume de la musique: 0 / 1 / 2 / 3", 10, 10+16*5)
  love.graphics.print("Quitter les options: Q", 10, 10+16*6)
end