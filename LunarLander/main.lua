function love.load()

  require('lander')
  love.window.setMode(640, 480, {vsync = false})

  sprites = {}
  sprites.background = love.graphics.newImage("sprites/background.png")
  sprites.lander = love.graphics.newImage("sprites/lander.png")
  sprites.thrust = love.graphics.newImage("sprites/thrust_lander.png")
  sprites.exploded = love.graphics.newImage("sprites/exploded_lander.png")

end


function love.update(dt)
  playerMovement(dt)
end


function love.draw()
  love.graphics.draw(sprites.background, 0, 0)
  love.graphics.draw(sprites.lander, lander.x, lander.y)
end

function playerMovement(dt)
  if love.keyboard.isDown("s") and lander.y < love.graphics.getHeight()
        then
          lander.y = lander.y + lander.speed * dt
        end

  if love.keyboard.isDown("w") and lander.y > 0
        then
          lander.y = lander.y - lander.speed * dt
        end

  if love.keyboard.isDown("d") and lander.x < love.graphics.getWidth()
        then
          lander.x = lander.x + lander.speed * dt
        end

  if love.keyboard.isDown("a") and lander.x > 0
        then
          lander.x = lander.x - lander.speed * dt
        end
end
