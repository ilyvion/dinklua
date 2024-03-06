-- item bomb

local fists = include("item-fst")

function use()
  dink.spawn("dam-bom")
  
  dink.kill_cur_item()
  -- nothing more will be read here, put stuff in disarm and drop if you need
  -- something done
end

function disarm()
  dink.debug("bomb disarmed.")
  
  dink.kill_this_task()
end

function arm()
  dink.preload_seq(420)
  dink.preload_seq(161)
  dink.preload_seq(166)

  fists.arm()
end

function pickup()
  dink.kill_this_task()
end

function drop()
  dink.debug("bomb removed");
  dink.draw_status()
  dink.kill_this_task()
end
