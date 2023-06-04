function Balle(x, y, rayon, r, g, b)
  love.graphics.setColor(r, g, b)
  love.graphics.circle("fill", x, y, rayon)
end

function Grid(i_start, i_end, i_pas, j_start, j_end, j_pas, r, g, b)
  for i=i_start, i_end, i_pas do
    for j=j_start, j_end, j_pas do
      love.graphics.setColor(r, g, b)
      love.graphics.rectangle("line", i, j, i_pas, j_pas)
    end
  end
end