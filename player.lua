Player = Object:extend()

function Player:new()
  self.x = 300
  self.y = 400
  self.spriteSheet = love.graphics.newImage("assets/crazy-square.png")
	self.width = self.spriteSheet:getWidth()
	self.height = self.spriteSheet:getHeight()
	self.frames = {}
	self.frame_width = 64
	self.frame_height = 64
	for i=1, 14 do
		table.insert(self.frames, love.graphics.newQuad(i * self.frame_width, 0,
			self.frame_width, self.frame_height, self.width, self.height))
	end
	self.currentFrame = 1
	self.sprite = self.frames[self.currentFrame]
end

function Player:update(dt)
  animationSpeed = 8 * dt
  movementSpeed = 64 * dt
  self.currentFrame = self.currentFrame + animationSpeed
	if self.currentFrame >= 14 then
		self.currentFrame = 1
	end
  if love.keyboard.isDown("w", "up") then
    self.y = self.y - movementSpeed
  elseif love.keyboard.isDown("s", "down") then
    self.y = self.y + movementSpeed
  end
  if love.keyboard.isDown("a", "left") then
    self.x = self.x - movementSpeed
  elseif love.keyboard.isDown("d", "right") then
    self.x = self.x + movementSpeed
  end
end

function Player:draw()
  love.graphics.draw(self.spriteSheet, self.frames[math.floor(self.currentFrame)],
			self.x,
			self.y)
end