function love.load()

  love.window.setMode(640, 480, {vsync = false})

  sprites = {}
  sprites.background = love.graphics.newImage("sprites/background.png")
  sprites.lander = love.graphics.newImage("sprites/lander.png")
  sprites.thrust = love.graphics.newImage("sprites/thrust_lander.png")
  sprites.exploded = love.graphics.newImage("sprites/exploded_lander.png")

end


function love.update(dt)

end


function love.draw()

  love.graphics.draw(sprites.background, 0, 0)

end
