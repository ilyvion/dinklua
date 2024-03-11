-- item boots

local items = include("_items")
local fists = include("item-fst")

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

use = fists.use
pickup = fists.pickup
drop = fists.drop
