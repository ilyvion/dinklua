function touch()
  player:freeze()
  player:move_stop(direction.SOUTH, 300, true)
  player.dir = direction.EAST
  player:say("It's locked")
  player:unfreeze()
end
