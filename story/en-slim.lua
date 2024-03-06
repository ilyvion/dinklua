--slime brain

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    exp = 8,
    timing = 20,
    hitpoints = 15,
    touch_damage = 6,
    base_attack = -1,
    base_walk = 690,
    base_death = 700
  }, {  
    651, 653,
    661, 663
  })
  
  if dink.random(2, 1) == 1 then
    current_sprite.target = player
  end
end

function touch()
  -- slurp noise
  dink.playsound(38, 18050, 6000, nil, false)
end

function hit(enemy_sprite)
  current_sprite.target = enemy_sprite
  --lock on to the guy who just hit us
  dink.playsound(38, 38050, 6000, player, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "small"
  )
end
