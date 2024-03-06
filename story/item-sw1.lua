--item sword1

local items = include("_items")

function use()
  items.use_item(100, 200, 8)
end

function disarm()
  player.attack_hit_sound = 0

  global.strength = global.strength - 4
  player.distance = 0
  player.range = 0
  dink.kill_this_task()
end

function arm()
  -- sword range
  player.distance = 50
  player.range = 40

  -- sword strength added
  global.strength = global.strength + 4

  player.attack_hit_sound = 10
  player.attack_hit_sound_speed = 8000
  
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw1- 71 43 64 69 -14 -10 14 10]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw2- 72 43 35 70 -21 -10 19 10]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw3- 73 43 28 69 -13 -9 13 9]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw4- 74 43 66 75 -14 -12 20 12]])

  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw6- 76 43 27 69 -23 -10 23 10]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw7- 77 43 38 94 -20 -10 20 10]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw8- 78 43 30 96 -15 -12 15 12]])
  dink.init([[load_sequence_now graphics\dink\sword\walk\d-sw9- 79 43 31 80 -13 -9 13 9]])

  dink.init([[load_sequence_now graphics\dink\sword\idle\d-si2- 12 250 74 73 -17 -12 16 9]])
  dink.init([[load_sequence_now graphics\dink\sword\idle\d-si4- 14 250 57 103 -11 -12 16 10]])
  dink.init([[load_sequence_now graphics\dink\sword\idle\d-si6- 16 250 30 92 -15 -9 11 9]])
  dink.init([[load_sequence_now graphics\dink\sword\idle\d-si8- 18 250 35 106 -15 -12 15 9]])

  dink.init([[load_sequence_now graphics\dink\sword\hit\d-sa2- 102 75 52 92 -23 -12 24 11]])
  dink.init([[load_sequence_now graphics\dink\sword\hit\d-sa4- 104 75 74 90 -23 -13 23 14]])
  dink.init([[load_sequence_now graphics\dink\sword\hit\d-sa6- 106 75 33 92 -18 -14 18 10]])
  dink.init([[load_sequence_now graphics\dink\sword\hit\d-sa8- 108 75 46 109 -17 -16 17 10]])
end

function pickup()
  dink.debug("Player now owns this item.")
  dink.kill_this_task()
end

function holdingdrop()
  -- this is run if the item is dropped while it is armed
  dink.init([[load_sequence_now graphics\dink\walk\ds-w1- 71 43 38 72 -14 -9 14 9]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w2- 72 43 37 69 -13 -9 13 9]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w3- 73 43 38 72 -14 -9 14 9]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w4- 74 43 38 72 -12 -9 12 9]])

  dink.init([[load_sequence_now graphics\dink\walk\ds-w6- 76 43 38 72 -13 -9 13 9]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w7- 77 43 38 72 -12 -10 12 10]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w8- 78 43 37 69 -13 -9 13 9]])
  dink.init([[load_sequence_now graphics\dink\walk\ds-w9- 79 43 38 72 -14 -9 14 9]])

  dink.init([[load_sequence_now graphics\dink\idle\ds-i2- 12 250 33 70 -12 -9 12 9]])
  dink.init([[load_sequence_now graphics\dink\idle\ds-i4- 14 250 30 71 -11 -9 11 9]])
  dink.init([[load_sequence_now graphics\dink\idle\ds-i6- 16 250 36 70 -11 -9 11 9]])
  dink.init([[load_sequence_now graphics\dink\idle\ds-i8- 18 250 32 68 -12 -9 12 9]])
end

function drop()
  dink.debug("Item dropped.")
  dink.kill_this_task()
end
