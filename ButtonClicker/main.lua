function love.load()                                          ----load
  gameState = 1  --- 1, menu --- 2, play

  circle = {}
  circle.x = love.graphics.getWidth()/2
  circle.y = love.graphics.getHeight()/2
  circle.radius = 75

  score = 0
  timer = 10

  myFont = love.graphics.newFont(40)
end


function love.update(dt)                                        ----update

  if gameState == 2
    then
      if  timer > 0
      then
        timer = timer - dt
      end
    end

  if timer < 0
    then
      timer = 0
      gameState = 1
      score = 0
    end

end


function love.draw()                                ----draw

  if gameState == 1
  then
    love.graphics.printf("Click anywhere to begin!", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
  end

  if gameState == 2
  then
    love.graphics.setColor(0, 255, 0)
    love.graphics.circle("fill", circle.x, circle.y, circle.radius)
  end

  love.graphics.setFont(myFont)
  love.graphics.setColor(255,255,255)
  love.graphics.print("Score: " .. score)
  love.graphics.print("Timer: " .. math.ceil(timer), 300, 0)

  function love.mousepressed(x, y, button)
      if button == 1 and gameState == 2
      then
        if distance(circle.x, circle.y, love.mouse.getX(), love.mouse.getY()) <= circle.radius
        then
          score = score + 1
          circle.x = math.random(circle.radius, love.graphics.getWidth() - circle.radius)
          circle.y = math.random(circle.radius, love.graphics.getHeight() - circle.radius)
        end
      end

      if gameState == 1
        then
          gameState = 2
          timer = 10
        end
  end

end

function distance(x1, y1, x2, y2)
  return math.sqrt(( x2 - x1 )^ 2 + ( y2 - y1 )^ 2)
end
