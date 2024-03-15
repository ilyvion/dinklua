function talk()
  player:say("Wow, they have a dish.")
end

function hit()
  local dish = dink.get_editor_sprite(7).sprite
  local crap = dish.pframe
  if crap > 1 then
    dish.reverse = true
    dish.seq = 425
  else
    dish.reverse = false
    dish.seq = 425
  end
end
