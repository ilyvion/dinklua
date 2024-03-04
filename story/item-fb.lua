local items = include("_items")
local misc = include("_misc")

function use()
  local mydir = player.dir
  local mholdx, mholdy = player.x, player.y

  items.use_magic_item(320, 100)
  items.use_magic_projectile(mydir, 500, 17, "dam-fire")
end

function disarm()
  global.magic_cost = 0
  dink.kill_this_task()
end

function arm()
  dink.debug("Preloading fireball")

  global.magic_cost = 100
  misc.preload_cardinal_seq(320)
  misc.preload_cardinal_seq(500)
  
  -- tree burn
  dink.preload_seq(20)
  
  -- explosion
  dink.preload_seq(70)
end

function pickup()
  dink.debug("Player now owns this item.")
  dink.kill_this_task()
end

function drop()
  dink.debug("Item dropped.")
  dink.kill_this_task()
end
