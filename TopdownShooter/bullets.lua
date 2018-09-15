function spawnBullet()
  bullet = {}
  bullet.x = player.x
  bullet.y = player.y
  bullet.speed = 500
  bullet.direction = playerMouseAngle()
  bullet.dead = false

  table.insert(bullets, bullet)
end

function bulletRemoval()
  for i=#bullets,1,-1
    do
      local b = bullets[i]

      if b.x < 0 or b.y < 0 or b.x > love.graphics.getWidth() or b.y > love.graphics.getHeight() or b.dead == true
        then
          table.remove(bullets, i)
        end
    end
end

function bulletMovement(dt)
  for i,b in ipairs(bullets)
    do
      b.x = b.x + math.cos(b.direction) * b.speed * dt
      b.y = b.y + math.sin(b.direction) * b.speed * dt
    end
end

function drawBullet()
  for i,b in ipairs(bullets)
    do
      love.graphics.draw(sprites.bullet, b.x, b.y, b.direction, 0.3, 0.3, sprites.bullet:getWidth()/3, sprites.bullet:getHeight()/3)
    end
end
