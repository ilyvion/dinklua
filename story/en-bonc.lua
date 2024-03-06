-- Bonca.. medium strength

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    distance = 50,
    timing = 33,
    exp = 30,
    base_walk = 530,
    base_death = 550,
    base_attack = 540,
    defense = 3,
    strength = 8,
    touch_damage = 4,
    hitpoints = 20
  }, {  
    531, 533, 537, 539,
    551, 553, 557, 559,
    542, 544, 546, 548
  })
end

function hit(enemy_sprite)
  dink.playsound(29, 22050, 0, current_sprite, false)
  current_sprite.target = enemy_sprite
  -- lock on to the guy who just hit us
end

function die()
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
