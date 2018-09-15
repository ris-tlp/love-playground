function love.load()
  gameState = 1 --1 play --2 main-menu

  sprites = {}
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')

  player = {}
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()/2
  player.speed = 180


  zombies = {}
  bullets = {}

end

function love.update(dt)

  playerMovement(dt)

end

function love.draw()

  love.graphics.draw(sprites.player, player.x, player.y)

end

function playerMovement(dt)

  if love.keyboard.isDown("s") and player.y < love.graphics.getHeight() - 50
    then
      player.y = player.y + player.speed * dt
    end

  if love.keyboard.isDown("w") and player.y > 0
    then
      player.y = player.y - player.speed * dt
    end

  if love.keyboard.isDown("d") and player.x < love.graphics.getWidth() - 50
    then
      player.x = player.x + player.speed * dt
    end

  if love.keyboard.isDown("a") and player.x > 0
    then
      player.x = player.x - player.speed * dt
    end

end
