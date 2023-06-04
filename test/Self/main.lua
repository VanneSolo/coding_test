listeSprites = {}

function AjouteSprite(px, py)
	local sprite = {}
	sprite.x = px
	sprite.y = py
	function sprite:Affiche()
		love.graphics.rectangle("fill", self.x, self.y, 10, 10)
	end
	table.insert(listeSprites, sprite)
end

AjouteSprite(50,50)
AjouteSprite(50,70)

function love.draw()
	--sprite:Affiche()
	for k,s in pairs(listeSprites) do
		s:Affiche()
	end
end
