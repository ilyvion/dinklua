-- script for individual fireball

function damage()
  current_sprite:kill_shadow()
  misc.initialize_sprite(current_sprite, {
    seq = 94,
    pseq = 94,
    frame = 1,
    brain = brain.MISSILE,
    touch_damage = 4,
    speed = 0,
    script = "dam-icee"
  })
end
