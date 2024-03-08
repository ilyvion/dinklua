-- script for aunts house

function main()
  volatile.aunt = misc.create_sprite_initialized(290, 250, 0, 0, 0, {
    script = "s2-auntp"
  })
end

function add_punch_commands(cs)
  cs:add_command("pl", function(_, x, y, sound_speed)
    dink.playsound(9, sound_speed, 0, nil, false)
    misc.create_sprite_initialized(x, y, brain.KILL_SEQ_DONE_LEAVE_LAST_FRAME, 188, 1, {
      seq = 188
    })
  end)
  cs:add_command("pr", function(_, x, y, sound_speed)
    dink.debug(tostring(x).."|"..tostring(y).."|"..tostring(sound_speed))
    dink.playsound(9, sound_speed, 0, nil, false)
    misc.create_sprite_initialized(x, y, brain.KILL_SEQ_DONE_LEAVE_LAST_FRAME, 189, 1, {
      seq = 189
    })
  end)
end
