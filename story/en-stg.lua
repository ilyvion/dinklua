-- slayer.. we don't have the death graphics yet, oh well

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    target = player,
    speed = 1,
    range = 60,
    distance = 60,
    timing = 33,
    exp = 400,
    base_walk = 820,
    base_attack = 810,
    defense = 18,
    strength = 35,
    touch_damage = 25,
    hitpoints = 40
  }, {{"c", 810}, 825, {"d", 820}})
end

function hit(enemy_sprite)
  current_sprite.brain = brain.MONSTER_DIAGONAL
  current_sprite.target = enemy_sprite
  dink.playsound(28, 28050, 0, current_sprite, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "xlarge"
  )
end

function attack()
  dink.playsound(27, 28050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
