function love.load()
    love.window.setMode(480,600)
    Object = require "classic"
    require "entity"
    require "bird"
    BirdImg = love.graphics.newImage("/assets/images/redbird-midflap.png")
    BirdPlayer = Bird(80,90,BirdImg)
end

function love.draw()
    love.graphics.setBackgroundColor(0,197,207,1)
    BirdPlayer:draw()
end

function love.update(dt)
    BirdPlayer:update(dt)
end