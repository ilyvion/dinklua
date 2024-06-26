-- item elixer

local fists = include("item-fst")

function use()
  global.life = global.life + 20
  if global.life > global.lifemax then
    global.life = global.lifemax
  end
  dink.playsound(22, 22050, 0, nil, false)
  
  -- lets make the star magic graphic effect
  misc.sparkle_around(player)
  
  dink.kill_cur_item()
  -- nothing more will be read here, put stuff in disarm and drop if you need
  -- something done
end

function disarm()
  dink.debug("Elixer disarmed.")
  
  dink.kill_this_task()
end

function arm()
  dink.preload_seq(169)
  
  fists.arm()
end

function pickup()
  dink.kill_this_task()
end

function drop()
  dink.debug("elixer removed");
  dink.draw_status()
  dink.kill_this_task()
end
