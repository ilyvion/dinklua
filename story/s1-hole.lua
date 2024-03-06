function main()
  dink.preload_seq(452)
end

function touch()
  if global.life < 1 then return end
  
  player:freeze()
  misc.initialize_sprite(player, {
    x = 274,
    y = 195,
    seq = 452,
    frame = 1,
    nocontrol = true, -- dink can't move until anim is done!
    brain = brain.NONE
  })
  current_sprite.touch_damage = 0
  dink.wait(2000)
  player.brain = brain.PLAYER
  misc.teleport(131, 289, 377)
end
