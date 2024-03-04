-- item boots

local items = include("_items")
local fists = include("item-fst")

function use()
  fists.use()
end

function disarm()
  player:set_speed(3)
  player.frame_delay = 0
  dink.debug("Disarming boots")
  dink.kill_this_task()
end

function arm()
  dink.debug("arming boots")
  fists.arm()

  player:set_speed(2)
  player.frame_delay = 30
end

function pickup()
  fists.pickup()
end

function drop()
  fists.drop()
end
