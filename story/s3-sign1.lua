function hit()
  player:say("'Sign' me up.. for DESTRUCTION! Haw haw!")
end

function talk()
  if global.story < 8 then
    current_sprite:say("`%KernSin is closed until preparation is complete.")
    dink.wait(1000)
    player:say("Huh?  What on earth can they be preparing?")
  else
    current_sprite:say("`%KernSin city limits.  Please enter our lovely town!")
  end
end
