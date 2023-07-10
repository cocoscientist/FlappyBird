Obstacle = Entity:extend()

function Obstacle:new(x,img)
    y = love.math.random(50,250)
    Obstacle.super.new(self,x,y,img)
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
end

function Obstacle:update(dt)
    self.x = self.x - 50*dt
    if self.x<(-1*self.width) then
        self.x = love.graphics.getWidth()
    end
end