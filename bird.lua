Bird = Entity:extend()

function Bird:new(x,y,img)
    Bird.super.new(self,x,y,img)
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.vel = 0
    self.grav = 15
end

function Bird:update(dt)
    self.vel = self.vel + self.grav*dt
    if love.keyboard.isDown("up") and self.y>0 then
        self.vel = -3
    end
    if self.vel>25 then
        self.vel = 25
    end
    self.y = self.y + self.vel
    if self.y>440 then
        self.y = 440
    elseif self.y<0 then
        self.y = 0
    end
end