-- script for tree

function main()
  dink.preload_seq(167)
  current_sprite.hard = false
  current_sprite:draw_hard()
end

function talk()
  current_sprite:say_stop("`0I'm tree years old.. HAW HAW HAW!")
  dink.wait(400)
  player:say_stop("That is also the LAMEST thing I've ever heard.")
end

function die()
  current_sprite:say("`0Your magic is treely useless against me.. HAW HAW HAW!")
  current_sprite.hard = false
  current_sprite:draw_hard()
end
