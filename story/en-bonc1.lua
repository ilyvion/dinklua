-- Bonca.. medium strength

local enemy = include("_enemy")

function main()
  dink.lock_screen()

  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    nohit = false,
    distance = 50,
    timing = 33,
    exp = 40,
    base_walk = 530,
    base_death = 550,
    base_attack = 540,
    defense = 3,
    strength = 8,
    touch_damage = 5,
    hitpoints = 20
  }, {{"d", 530}, {"d", 550}, {"c", 540}})
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
