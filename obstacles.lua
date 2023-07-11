Obstacle = Object.extend(Object)

function Obstacle:new(x)
    self.x = x
    self.y = love.math.random(100,290)
    self.width = 60
    self.space = 110
    self.passed = false
end

function Obstacle:draw()
    love.graphics.setColor(0.1,0.9,0.1)
    love.graphics.rectangle("fill",self.x,0,self.width,self.y)
    love.graphics.rectangle("fill",self.x,self.y+self.space,self.width,love.graphics.getHeight()-self.y-self.space)
    love.graphics.setColor(1,1,1)
end

function Obstacle:update(dt)
    self.x = self.x - 50*dt
    if self.x<(-1*self.width) then
        self.x = 660
        self.y = love.math.random(100,290)
        self.passed = false
    end
end

function Obstacle:collision(Bird)
    if self.passed then
        return false
    else
        return not (Bird.x+Bird.width<self.x or (Bird.y>self.y and Bird.y+Bird.height<self.y+self.space))
    end
end

function Obstacle:checkPass(Bird)
    if self.passed then
        return false
    elseif self.x+self.width<Bird.x then
        self.passed = true
        return true
    else
        return false
    end
end