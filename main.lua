function love.load()
    love.window.setMode(640,480)
    Object = require "classic"
    require "entity"
    require "bird"
    require "obstacles"
    Score = 0
    GameOver = false
    BirdImg = love.graphics.newImage("/assets/images/redbird-midflap.png")
    ObstacleImg = love.graphics.newImage("/assets/images/pipe-green.png")
    BirdPlayer = Bird(75,240,BirdImg)
    ObstacleList = {Obstacle(180), Obstacle(300), Obstacle(420), Obstacle(540), Obstacle(660), Obstacle(780)}
end

function love.draw()
    love.graphics.setBackgroundColor(0,0.65,0.93,1)
    for i, obs in ipairs(ObstacleList) do
        obs:draw()
    end
    BirdPlayer:draw()
    love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Score: "..tostring(Score)),3,7)
    if GameOver then
        love.graphics.setColor(0.3,0.1,0.5)
        love.graphics.rectangle("fill",240,240,240,240)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Game Over, Score: "..tostring(Score)),360,360)
    end
end

function love.update(dt)
    BirdPlayer:update(dt)
    if not GameOver then
        for i, obs in ipairs(ObstacleList) do
            obs:update(dt)
            if obs:checkPass(BirdPlayer) then
                Score = Score + 1
            elseif obs:collision(BirdPlayer) then
                GameOver = true
            end
        end 
    end
end