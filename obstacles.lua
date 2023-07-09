Obstacle = Object.extend(Object)

function Obstacle:new(x)
    self.x = x
    self.y = love.math.random(50,490)
    self.space = 65
    self.width = 50
    self.vel = 55
end

function Obstacle:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,120)
end

function Obstacle:update(dt)
    self.x = self.x - self.vel*dt
    if self.x>(-1*self.width) then
        self.x = love.graphics.getWidth()
        self.y = love.math.random(50,490)
    end
end