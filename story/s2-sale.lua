function talk()
  player:freeze()
  current_sprite:say_stop("`%House for Sale:  Contact Charlie for information.")
  dink.wait(250)
  player.dir = direction.SOUTH
  player:say_stop("I wonder who Charlie is ...")
  player:unfreeze()
end
