function talk()
  if global["s4-duck"] < 2 then
    current_sprite:say("`%Duck Worship Center")
  else
    current_sprite:say_stop("`%Dink Worship Center")
    player:say("It sure is easy to be deified these days.")
  end
end
