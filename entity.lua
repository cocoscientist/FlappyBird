Entity = Object.extend(Object)

function Entity:new(x,y,img)
    self.x = x
    self.y = y
    self.img = img
end

function Entity:draw()
    love.graphics.draw(self.img,self.x,self.y)
end