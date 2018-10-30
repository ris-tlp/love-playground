lander = {}
lander.x = 300
lander.y = 100
lander.speed = 180
lander.angle = 0
lander.fuel = 100
lander.exploded = false

function isExploded()
  if lander.x > love.graphics:getWidth() or lander.x < 0
    then
      lander.exploded = true
      return lander.exploded
    end
end
