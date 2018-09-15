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

  table.insert(zombies, zombie)
end

function zombieRemoval()
  for i,z in ipairs(zombies)
    do
      local z = zombies[i]

      if z.dead == true
        then
          table.remove(zombies, i)
        end
    end
  end

function zombieMovement(dt)
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
              player.x = love.graphics.getWidth()/2
              player.y = love.graphics.getHeight()/2
            end
        end
    end
end

function drawZombie()
  for i,z in ipairs(zombies)
    do
      love.graphics.draw(sprites.zombie, z.x, z.y, zombiePlayerAngle(z), nil, nil, sprites.player:getWidth()/2, sprites.player:getHeight()/2)
    end
end
