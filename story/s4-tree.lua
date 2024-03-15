local lines = {
  "OUCH!",
  "There is a rock near the Duck Idol with a crack in it...",
  "Please sir, don't hurt me, the talking tree of the east!",
  "That one smarted!",
  "That's gonna leave a mark!"
}

function hit()
  current_sprite:say_stop("`4"..lines[dink.random(5, 1)])
end

function talk()
  player:say("It's an apple tree.", 1);
end
