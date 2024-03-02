function main()
  if global.boat == 1 then
    current_sprite.active = false
    return
  end
  global.boat = 1
  dink.playsound(35, 22050, 0, nil, false)
  current_sprite.speed = 1
  current_sprite:move_stop(direction.SOUTH_WEST, 750, true)
  current_sprite.active = false
end
