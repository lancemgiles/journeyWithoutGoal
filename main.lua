function love.load()
  Object = require "lib/classic"
  Player = require "player"
  bg = love.graphics.newImage("assets/bg.png")
  music = love.audio.newSource('assets/aBeautifulAndGoodLife.ogg',
		'stream')
	music:setLooping(true)
	music:play()
	love.graphics.setNewFont(36)
	title = "Journey without Goal"
	timer = 0
	isTitleScreen = true
end

function love.update(dt)
  titleTimer(dt)
end
  

function love.draw()
  love.graphics.draw(bg, 0, 0)
  displayTitle()
end

function displayTitle()
	if isTitleScreen then
		love.graphics.print(title, 400, 400)
		print(title)
	end
end

function titleTimer(dt)
	timer = timer + 1 * dt
	if timer >= 3 then
		isTitleScreen = false
	end
end

function love.keypressed(key)
	if key == "q" then
		love.event.quit()
	end
end
