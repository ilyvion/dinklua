function main()
  if global.thief == 2 then
    current_sprite.active = false
  end
end

function touch()
  player:move_stop(direction.SOUTH, 140, 1)
  player:say("It's locked.")
end
