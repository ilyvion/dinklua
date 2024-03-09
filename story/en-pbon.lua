-- Bonca.. medium strength

local enemy = include("_enemy")

function main()
  dink.lock_screen()

  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    nohit = false,
    distance = 50,
    timing = 0,
    exp = 25,
    base_walk = 610,
    base_death = 550,
    base_attack = 620,
    defense = 3,
    strength = 8,
    touch_damage = 5,
    hitpoints = 30
  }, {{"d", 610}, {"d", 620}, {"c", 540}})
end

function hit(enemy_sprite)
  dink.playsound(29, 22050, 0, current_sprite, false)
  current_sprite.target = enemy_sprite
  -- lock on to the guy who just hit us
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
    "medium"
  )
end

function attack()
  dink.playsound(31, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
