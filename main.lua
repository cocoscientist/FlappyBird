function love.load()
    love.window.setMode(480,480)
    Object = require "classic"
    require "entity"
    require "bird"
    require "obstacles"
    BirdImg = love.graphics.newImage("/assets/images/redbird-midflap.png")
    ObstacleImg = love.graphics.newImage("/assets/images/pipe-green.png")
    BirdPlayer = Bird(80,90,BirdImg)
    ObstacleList = {Obstacle(120, ObstacleImg), Obstacle(210, ObstacleImg), Obstacle(300, ObstacleImg), Obstacle(390, ObstacleImg), Obstacle(480, ObstacleImg)}
end

function love.draw()
    love.graphics.setBackgroundColor(0,0.65,0.93,1)
    BirdPlayer:draw()
    for i, obs in ipairs(ObstacleList) do
        obs:draw()
    end
end

function love.update(dt)
    BirdPlayer:update(dt)
    for i, obs in ipairs(ObstacleList) do
        obs:update(dt)
    end
end