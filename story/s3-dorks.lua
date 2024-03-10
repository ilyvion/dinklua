local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    distance = 62,
    range = 50,
    defense = 6,
    strength = 12,
    touch_damage = 5,
    hitpoints = 100,
    target = player,
    exp = 150
  }, {{"c", 740}, {"d", 300}, 305})
end

function hit()
  current_sprite.target = player
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
    "large"
  )
end

function attack()
  dink.playsound(8, 5050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
