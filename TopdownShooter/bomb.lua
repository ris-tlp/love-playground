function spawnBomb()

  bomb = {}
  bomb.x = player.x
  bomb.y = player.y
  -- bomb.count = 2
  bomb.dead = false
  bomb.timer = 2
  bomb.spawn = true

  table.insert(bombs, bomb)

end

function drawBomb()
  for i,b in ipairs(bombs)
    do
        if b.dead == false
          then
            love.graphics.draw(sprites.bomb, b.x, b.y, nil, 0.1, 0.1)
          end
    end
end

function bombRemoval()
  for i=#bombs,1,-1
    do
      local b = bombs[i]
      if b.dead == true
        then
          b = nil
        end
    end
end
