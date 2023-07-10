function love.load()
    love.window.setMode(640,480)
    Object = require "classic"
    require "entity"
    require "bird"
    require "obstacles"
    Score = 0
    BirdImg = love.graphics.newImage("/assets/images/redbird-midflap.png")
    ObstacleImg = love.graphics.newImage("/assets/images/pipe-green.png")
    BirdPlayer = Bird(75,240,BirdImg)
    ObstacleList = {Obstacle(120), Obstacle(240), Obstacle(360), Obstacle(480), Obstacle(600), Obstacle(720)}
end

function love.draw()
    love.graphics.setBackgroundColor(0,0.65,0.93,1)
    for i, obs in ipairs(ObstacleList) do
        obs:draw()
    end
    BirdPlayer:draw()
    love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Score: "..tostring(Score)),3,7)
end

function love.update(dt)
    BirdPlayer:update(dt)
    for i, obs in ipairs(ObstacleList) do
        obs:update(dt)
        if obs:checkPass(BirdPlayer) then
            Score = Score + 1
        end
    end
end