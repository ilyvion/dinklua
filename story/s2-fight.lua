function die()
  local speech_sprite = misc.death_speak(current_sprite, "`1Ahhhhhhh")
  dink.script_attach(1000)
  dink.wait(400)
  
  -- Phoenix: fix for the barfight
  volatile.barkeep.custom.guards = volatile.barkeep.custom.guards - 1
  if volatile.barkeep.custom.guards == 0 then
    volatile.barkeep.custom.busy = 1
    player:freeze()
    player:say_stop("Haw!")
    dink.wait(500)
    volatile.barkeep:say_stop("`4Ah, jeez...")
    volatile.barkeep:say_stop("`4Did not see it going that way.")
    dink.playmidi("5.mid")
    player:unfreeze()
  end

  dink.kill_this_task()
end

function attack()
  dink.playsound(36, 22050, 0,current_sprite, false);
  current_sprite.attack_wait = dink.random(4000, 0)
  current_sprite.target = player
end
