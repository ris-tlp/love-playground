function love.load()

  require('zombies')
  require('bullets')
  require('bomb')

  gameState = 1 --1 main menu --2 play
  myFont = love.graphics.newFont(40)

  sprites = {}
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')
  sprites.background = love.graphics.newImage('sprites/background.png')
  sprites.bomb = love.graphics.newImage('sprites/bomb.png')

  player = {}
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()/2
  player.speed = 180

  zombies = {}
  bullets = {}
  bombs = {}

  maxTime = 2
  timer = maxTime
  score = 0
  bombCount = 2
end

function love.update(dt)

  playerMovement(dt)
  zombieMovement(dt)
  bulletMovement(dt)
  bulletRemoval()
  zombieRemoval()
  bombRemoval()


    for i,b in ipairs(bombs)
      do
        if b.spawn == true and b.timer > 0
          then
            b.timer = b.timer - dt

            if b.timer <= 0
              then
                b.explosion = true
              end
          end
      end

      for i,b in ipairs(bombs)
      do
        for j,z in ipairs(zombies)
          do
            if distance(b.x, b.y, z.x, z.y) < 50 and b.explosion == true
              then
                z.dead = true
                b.dead = true
                score = score + 1

                b.x = -10000
                b.y = -10000
              end
          end
      end

    for i,z in ipairs(zombies)
      do
        for j,b in ipairs(bullets)
          do
            if distance(z.x, z.y, b.x, b.y) < 20
              then
                z.dead = true
                b.dead = true
                score = score + 1
              end
          end
      end

    if gameState == 2
      then
        timer = timer - dt

        if timer <= 0
          then
            spawnZombie()
            maxTime = maxTime * 0.95
            timer = maxTime
          end
      end

end

function love.draw()
  love.graphics.draw(sprites.background)
  love.graphics.print("Bombs: " .. bombCount)

  if gameState == 1
    then
      love.graphics.setFont(myFont)
      love.graphics.printf("Click anywhere to begin!", 0, 50, love.graphics.getWidth(), "center")
    end

  love.graphics.printf("Score: " .. score, 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), "center")
  love.graphics.draw(sprites.player, player.x, player.y, playerMouseAngle(), 1.4, 1.4, sprites.player:getWidth()/2, sprites.player:getHeight()/2)

  drawBomb()
  drawZombie()
  drawBullet()

end

function playerMovement(dt)

  if gameState == 2
    then
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
end

function love.mousepressed(x, y, b, istouch)
  if b == 1 and gameState == 2
    then
      spawnBullet()
    end

  if gameState == 1
    then
      gameState = 2
      maxTime = 2
      timer = maxTime
      score = 0
      bombCount = 2
    end
end

function love.keypressed(key, scancode, isrepeat, dt)
  if key == "z" and gameState == 2 and bombCount > 0
    then
      spawnBomb()
      bombCount = bombCount - 1
    end
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
