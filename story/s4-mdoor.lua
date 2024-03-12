local who

function main()
  who = dink.get_editor_sprite(7).sprite
end

function touch()
  player:move_stop(direction.SOUTH, 175, true)
  player.dir = direction.EAST

  if global.story > 10 then
    who:say("`3Thank you for saving us Dink!")
    return
  end

  player:freeze()
  
  local what = dink.random(6, 1)
  if what == 1 then
    who:say("`3It's locked.")
  elseif what == 2 then
    who:say("`3Go away.")
  elseif what == 3 then
    who:say("`3I hate you.")
  elseif what == 4 then
    who:say("`3Noooooooo!!")
  elseif what == 5 then
    who:say("`3You can't get in.")
  else
    who:say("`3Leave me alone.")
  end
  
  player:unfreeze()
end
