-- script for tree

function main()
  dink.preload_seq(167)
end

function die()
  missile_target.seq = 20
  dink.playsound(6, 8000, 0, missile_target, false)
  dink.wait(500)
  dink.wait(500)
  dink.playsound(43, 22050, 0, nil, false)

  local mcrap = dink.create_sprite(current_sprite.x, current_sprite.y, 7, 167, 1)
  mcrap.seq = 167

  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    size = 100,
    touch_damage = -1,
    seq = 0,
    pseq = 89,
    pframe = 10
  })
end

function touch()
  if global.life < 1 then return end
  dink.playsound(39, 22050, 0, nil, false)
  dink.script_attach(1000)
  misc.teleport(101, 515, 383)
  dink.kill_this_task()
end
