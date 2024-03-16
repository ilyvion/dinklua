-- item bow

bonus_strength = 0
bowlore_dividend = 3

function use()
  dink.activate_bow()
  local mypower = dink.get_last_bow_power()

  if mypower < 100 then return end

  dink.playsound(44, 22050, 0, nil, false)

  local x, y, mydir = player.x, player.y, player.dir
  local pframe = mydir
  if mydir == direction.EAST then
    x = x + 30
  elseif mydir == direction.WEST then
    x = x - 30
  elseif mydir == direction.NORTH_EAST then
    pframe = 5
  end

  local junk = misc.create_sprite_initialized(x, y, brain.MISSILE, 25, pframe, {
    dir = mydir,
    timing = 0,
    speed = 6,
    range = 10,
    flying = true,
    script = "dam-a1"
  })

  mypower = mypower / 100
  local temp = global.strength / 5
  if temp == 0 then temp = 1 end
  mypower = mypower * temp

  if global.bowlore == 1 and dink.random(bowlore_dividend, 1) == 1 then
    mypower = mypower * 3
    if bowlore_dividend ~= 1 then
      dink.playsound(44, 14050, 0, nil, false)
      player:say("`4* POWER SHOT *")
    else
      dink.playsound(17, 8000, 0, nil, false)
    end
  end
  junk.strength = mypower

  local mshadow = misc.create_sprite_initialized(x, y, brain.SHADOW, 432, 3, {
    brain_parm = junk.sprite_number,
    que = -500,
    nohit = true
  })
  junk.brain_parm = 1
  junk.brain_parm2 = mshadow.sprite_number
end

function disarm()
  if bonus_strength > 0 then
    global.strength = global.strength - bonus_strength
  end
  dink.kill_this_task()
end

function arm()
  if bonus_strength > 0 then
    global.strength = global.strength + bonus_strength
  end
  player.attack_hit_sound = 0
  
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw1- 71 43 30 84 -14 -10 14 10]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw2- 72 43 29 86 -21 -10 19 10]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw3- 73 43 35 79 -13 -9 13 9]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw4- 74 43 41 79 -18 -12 20 12]])
  
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw6- 76 43 47 78 -23 -10 23 10]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw7- 77 43 46 71 -20 -10 20 10]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw8- 78 43 35 76 -15 -12 15 12]])
  dink.init([[load_sequence_now graphics\dink\bow\walk\d-bw9- 79 43 46 78 -13 -9 13 9]])
  
  dink.init([[load_sequence_now graphics\dink\bow\idle\d-bi2- 12 250 35 87 -17 -12 16 9]])
  dink.init([[load_sequence_now graphics\dink\bow\idle\d-bi4- 14 250 37 77 -11 -12 16 10]])
  dink.init([[load_sequence_now graphics\dink\bow\idle\d-bi6- 16 250 35 83 -15 -9 11 9]])
  dink.init([[load_sequence_now graphics\dink\bow\idle\d-bi8- 18 250 33 70 -15 -12 15 9]])
  
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba2- 102 75 27 89 -23 -12 24 11]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba4- 104 75 76 79 -23 -13 23 14]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba6- 106 75 37 81 -14 -10 14 10]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba8- 108 75 31 89 -17 -16 17 10]])
  
  -- bow weapon diags

  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba1- 101 75 57 84 -20 -12 20 12]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba3- 103 75 33 86 -19 -13 19 13]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba7- 107 75 54 82 -19 -11 19 11]])
  dink.init([[load_sequence_now graphics\dink\bow\hit\d-ba9- 109 75 37 78 -21 -10 21 10]])

  dink.preload_seq(25)
end

function pickup()
  dink.debug("Player now owns this item.")
  dink.kill_this_task()
end

function drop()
  dink.debug("Item dropped.")
  dink.kill_this_task()
end
