function damage()
  if missile_target == nil then
    misc.initialize_sprite(current_sprite, {
      speed = 0,
      brain = brain.NONE,
      nohit = true,
    })
    dink.playsound(41, 22050, 0, nil, false)
    dink.kill_this_task()
  end

  if missile_target.editor_sprite ~= nil then
    if missile_target.brain ~= brain.NONE then
      -- looks like we should not make the arrow stick
      current_sprite:kill_shadow()
      current_sprite.active = false
      dink.playsound(41, 22050, 0, nil, false)
      dink.kill_this_task()
    else
      misc.initialize_sprite(current_sprite, {
        speed = 0,
        brain = brain.NONE,
      })
      dink.playsound(41, 22050, 0, nil, false)
    end
  else
    current_sprite:kill_shadow()
    current_sprite.active = false
    dink.playsound(41, 22050, 0, nil, false)
    dink.kill_this_task()
  end
end

function hit()
  dink.playsound(37, 28050, 0, nil, false)
  current_sprite.active = false
  current_sprite.nohit = true
end
