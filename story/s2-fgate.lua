local temp1hold

function main()
  current_sprite.nodraw = true
  current_sprite.touch_damage = -1

  -- TODO: use volatile?
  global.temp1hold = 0
end

function touch()
  -- TODO: use volatile?
  if global.temp1hold ~= 0 then return end

  current_sprite.touch_damage = 0
  dink.playsound(42, 10000, 0, nil, false)
  dink.playsound(15, 22000, 0, nil, false)
  global.life = global.life - 5
  local myx, myy = player.x, player.y - 60
  local mcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 1)
  mcrap.seq = 169

  myx, myy = myx - 30, myy - 30
  local dcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 3)
  dcrap.seq = 169
  dcrap.frame = 3

  myx, myy = myx + 60, myy + 10
  local rcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 6)
  rcrap.seq = 169
  rcrap.frame = 6

  player:say("Ouch!")

  if global.life < 1 then
    return
  else
    player:move_stop(direction.SOUTH, 170, true)
    current_sprite.touch_damage = -1
  end

  mcrap.kill = 1500
  dcrap.kill = 1500
  rcrap.kill = 1500

  dink.wait(1000)

  mcrap.brain_parm = 40
  mcrap.brain = brain.BRAIN_PARM_SIZE_MATCH
  dcrap.brain_parm = 40
  dcrap.brain = brain.BRAIN_PARM_SIZE_MATCH
  rcrap.brain_parm = 40
  rcrap.brain = brain.BRAIN_PARM_SIZE_MATCH
end
