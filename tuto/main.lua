largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

brick = require("brick")
world = require("world")
state = require("state")

function Level(level, p_seq, p_cur_level)
  local lvl = {}
  lvl.bricks = {}
  lvl.init = Require_Level("levels/", p_seq, p_cur_level)
  lvl.settings = {
    nb_cols = #lvl.init[1],
    nb_lignes = #lvl.init
  }
  lvl.largeur_col = largeur/lvl.settings.nb_cols
  lvl.hauteur_ligne = 20
  for i=1,#lvl.init do
    for j=1,#lvl.init[i] do
      if lvl.init[i][j] == 1 then
        table.insert(lvl.bricks, brick((j-1)*lvl.largeur_col, (i-1)*lvl.hauteur_ligne, lvl.largeur_col, lvl.hauteur_ligne, "brick"))
      end
    end
  end
  -------------------------------------------------------------  
  lvl.Update = function(dt)
    lvl.init = Require_Level("levels/", p_seq, p_cur_level)
    lvl.settings.nb_cols = #lvl.init[1]
    lvl.settings.nb_lignes = #lvl.init
    lvl.largeur_col = largeur/lvl.settings.nb_cols
    
    for i=1,#lvl.init do
      for j=1,#lvl.init[i] do
        if lvl.init[i][j] == 1 then
          table.insert(lvl.bricks, brick((j-1)*lvl.largeur_col, (i-1)*lvl.hauteur_ligne, lvl.largeur_col, lvl.hauteur_ligne, "brick"))
        end
      end
    end
  end
  -------------------------------------------------------------
  lvl.Draw = function()
    for i=1,#lvl.bricks do
      lvl.bricks[i]:draw()
    end
    
    for i=1,#lvl.init do
      for j=1,#lvl.init[i] do
        if lvl.init[i][j] == 1 then
          love.graphics.setColor(0, 1, 0)
          --love.graphics.rectangle("fill", (j-1)*lvl.largeur_col, (i-1)*lvl.hauteur_ligne, lvl.largeur_col, lvl.hauteur_ligne)
          --lvl.bricks[i]:draw()
          love.graphics.setColor(1, 1, 1)
          love.graphics.print("O", (j-1)*lvl.largeur_col + lvl.largeur_col/2, (i-1)*lvl.hauteur_ligne)
        elseif lvl.init[i][j] == 0 then
          love.graphics.print(" ", (j-1)*lvl.largeur_col + lvl.largeur_col/2, (i-1)*lvl.hauteur_ligne)
        end
        love.graphics.rectangle("line", (j-1)*lvl.largeur_col, (i-1)*lvl.hauteur_ligne, lvl.largeur_col, lvl.hauteur_ligne)
      end
    end
  end
  -------------------------------------------------------------
  lvl.Keypressed = function(key)
    if key == "up" and p_cur_level<#p_seq then
      p_cur_level = p_cur_level + 1
      lvl.bricks = {}
    elseif key == "down" and p_cur_level>1 then
      p_cur_level = p_cur_level - 1
      lvl.bricks = {}
    end
  end
  return lvl
end

function Require_Level(p_folder, p_file, p_cur_level)
  local level = require(p_folder..p_file[p_cur_level])
  return level
end

function love.load()  
  seq = require("levels/sequence")
  cur_level = 1
  
  niveau = Level("levels/", seq, cur_level)
end

function love.update(dt)
  world:update(dt)
  niveau.Update(dt)
end

function love.draw()
  niveau.Draw()
end

function love.keypressed(key)
  niveau.Keypressed(key)
end