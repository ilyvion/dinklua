function main()
  current_sprite.nodraw = true
  current_sprite.touch_damage = -1

  -- TODO: use volatile?
  global.temp1hold = 0
end

function touch()
  -- TODO: use volatile?
  if global.temp1hold ~= 0 then return end

  current_sprite.touch_damage = 0
  dink.playsound(42, 10000, 0, nil, false)
  dink.playsound(15, 22000, 0, nil, false)
  global.life = global.life - 5
  player:say("Ouch!")

  misc.sparkle_around(player)

  if global.life < 1 then
    return
  else
    player:move_stop(direction.SOUTH, 170, true)
    current_sprite.touch_damage = -1
  end
end
