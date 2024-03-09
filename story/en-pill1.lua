-- pillbug brain

local enemy = include("_enemy")

function main()
  dink.lock_screen()

  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 2,
    nohit = false,
    exp = 10,
    base_walk = 130,
    base_death = 140,
    touch_damage = 3,
    hitpoints = 15
  }, {  
    131, 133,
    141, 143
  })
  
  if dink.random(2, 1) == 1 then
    current_sprite.target = player
  end
end

function hit(enemy_sprite)
  current_sprite.target = enemy_sprite
  dink.playsound(30, 17050, 4000, current_sprite, false)
end

function die()
  if dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite) == nil then
    -- no more brain 9 monsters here, lets unlock the screen
    dink.unlock_screen()
    dink.playsound(43, 22050, 0, nil, false)
  end
  
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "small"
  )
end
