local items = include("_items")

function use()
  local mydir = player.dir

  items.use_magic_item(320, 100, "h")
  items.use_magic_projectile(mydir, 163, 17, "dam-ice", 6, false)
end

function disarm()
  global.magic_cost = 0
  dink.kill_this_task()
end

function arm()
  dink.debug("Preloading ice")

  global.magic_cost = 1000
  misc.preload_cardinal_seq(163)
  misc.preload_cardinal_seq(94)
end

function pickup()
  dink.debug("Player now owns this item.")
  dink.kill_this_task()
end

function drop()
  dink.debug("Item dropped.")
  dink.kill_this_task()
end
