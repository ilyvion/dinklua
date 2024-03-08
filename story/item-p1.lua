local items = include("_items")

function use()
  player:freeze()
  player:say_stop("Vas Neeko Matrid Osana")

  if global.player_map == 366 then
    dink.preload_seq(167)

    dink.playsound(24, 22052, 0, nil, false)
    misc.create_sprite_initialized(300, 90, brain.BRAIN_PARM_SIZE_MATCH, 167, 1, {
      seq = 167,
      brain_parm = 400
    })
    dink.wait(400)
    
    dink.playsound(24, 22052, 0, nil, false)
    misc.create_sprite_initialized(350, 30, brain.BRAIN_PARM_SIZE_MATCH, 167, 1, {
      seq = 167,
      brain_parm = 400
    })
    dink.wait(1000)

    dink.playsound(43, 22050, 0, nil, false)
    volatile.gate_disabled = true
  end

  player:unfreeze()
  global.magic_level = 0
  dink.draw_status()
end

function disarm()
  global.magic_cost = 0
  dink.kill_this_task()
end

function arm()
  dink.debug("Preloading mordavia")

  global.magic_cost = 200
end

function pickup()
  dink.debug("Player now owns this item.")
  dink.kill_this_task()
end

function drop()
  dink.debug("Item dropped.")
  dink.kill_this_task()
end
