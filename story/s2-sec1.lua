-- script for tree

local misc = include("_misc")

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

  current_sprite.brain = brain.NONE
  current_sprite.size = 100
  current_sprite.touch_damage = -1
  current_sprite.seq = 0
  current_sprite.pseq = 89
  current_sprite.pframe = 10
end

function touch()
  if global.life < 1 then return end
  dink.playsound(39, 22050, 0, nil, false)
  dink.script_attach(1000)
  misc.teleport(101, 515, 383)
  dink.kill_this_task()
end
