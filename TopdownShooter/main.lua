function love.load()
  gameState = 2 --1 main menu --2 play

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

  for i,z in ipairs(zombies)
    do
      z.x = z.x + math.cos(zombiePlayerAngle(z)) * z.speed * dt
      z.y = z.y + math.sin(zombiePlayerAngle(z)) * z.speed * dt

      if distance(z.x, z.y, player.x, player.y) < 20
        then
          for i,z in ipairs(zombies)
            do
              zombies[i] = nil
              gameState = 1
            end
        end
    end
end

function love.draw()
  love.graphics.draw(sprites.background)
  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), 1.2, 1.2, sprites.player:getWidth()/2, sprites.player:getHeight()/2)

  for i,z in ipairs(zombies)
    do
      love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, sprites.player:getWidth()/2, sprites.player:getHeight()/2)
    end

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

function spawnZombie()

  zombie = {}
  zombie.x = 150
  zombie.y = 150
  zombie.speed = 130
  zombie.dead = false
  local side = math.random(1,4)  --1 up --2 right --3 down --4 left

  if side == 1
    then
      zombie.x = math.random(0,love.graphics.getWidth())
      zombie.y = -20
  elseif side == 2
    then
      zombie.x = love.graphics.getWidth() + 20
      zombie.y = math.random(0,love.graphics.getHeight())
  elseif side == 3
    then
      zombie.x = math.random(0,love.graphics.getWidth())
      zombie.y = love.graphics.getHeight() + 20
  else
      zombie.x = -20
      zombie.y = math.random(0,love.graphics.getHeight())
  end

  table.insert(zombies,zombie)

end

function playerMouseAngle()
  return math.atan2(love.mouse.getY() - player.y, love.mouse.getX() - player.x)
end

function zombiePlayerAngle(enemy)
  return math.atan2(player.y - enemy.y, player.x - enemy.x)
end

function distance(x1, y1, x2, y2)
  return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2)
end
