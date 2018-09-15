function love.load()
  gameState = 1 --1 play --2 main-menu

  sprites = {}
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')
  sprites.background = love.graphics.newImage('sprites/background.png')

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
  love.graphics.draw(sprites.background)
  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), 1.2, 1.2, sprites.player:getWidth()/2, sprites.player:getHeight()/2)

end

function playerMovement(dt)

  if love.keyboard.isDown("s") and player.y < love.graphics.getHeight()
    then
      player.y = player.y + player.speed * dt
    end

  if love.keyboard.isDown("w") and player.y > 0
    then
      player.y = player.y - player.speed * dt
    end

  if love.keyboard.isDown("d") and player.x < love.graphics.getWidth()
    then
      player.x = player.x + player.speed * dt
    end

  if love.keyboard.isDown("a") and player.x > 0
    then
      player.x = player.x - player.speed * dt
    end

end

function playerMouseAngle()
  return math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
end
