function love.load()
    love.window.setMode(640,480)
    Object = require "classic"
    require "entity"
    require "bird"
    require "obstacles"
    Score = 0
    GameOver = false
    BirdImg = love.graphics.newImage("/assets/images/redbird-midflap.png")
    BirdPlayer = Bird(75,240,BirdImg)
    ObstacleList = {Obstacle(180), Obstacle(300), Obstacle(420), Obstacle(540), Obstacle(660), Obstacle(780)}
end

function love.draw()
    love.graphics.setBackgroundColor(0,0.65,0.93,1)
    for i, obs in ipairs(ObstacleList) do
        obs:draw()
    end
    love.graphics.setColor(0.478,0.478,0.2)
    love.graphics.rectangle("fill",0,440,640,40)
    love.graphics.setColor(1,1,1)
    BirdPlayer:draw()
    love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Score: "..tostring(Score)),3,7)
    if GameOver then
        love.graphics.setColor(0.1,0.3,0.5)
        love.graphics.rectangle("fill",240,180,180,100)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Game Over, Score: "..tostring(Score)),265,200)
        love.graphics.draw(love.graphics.newText(love.graphics.getFont(),"Press Up to Restart"),265,220)
    end
end

function love.keypressed(key)
    if GameOver and key=="up" then
        Score = 0
        GameOver = false
        BirdPlayer = Bird(75,240,BirdImg)
        ObstacleList = {Obstacle(180), Obstacle(300), Obstacle(420), Obstacle(540), Obstacle(660), Obstacle(780)}
    end
end

function love.update(dt)
    BirdPlayer:update(dt)
    if BirdPlayer.y>439 then
        GameOver = true
    end
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