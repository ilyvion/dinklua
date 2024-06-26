local items = include("_items")

function use()
  local mydir = player.dir

  items.use_magic_item(320, 100, "v")
  items.use_magic_projectile(mydir, 500, 17, "dam-fire", 10, true)
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
