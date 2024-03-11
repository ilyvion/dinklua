-- goblin with axe

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.SMART_PEOPLE,
    speed = 1,
    distance = 50,
    range = 35,
    timing = 0,
    frame_delay = 55,
    exp = 150,
    base_walk = 800,
    base_attack = 790,
    defense = 2,
    strength = 20,
    touch_damage = 8,
    hitpoints = 60,
  }, {{"c", 790}, {"d", 800}, 805})
end

function hit(enemy_sprite)
  current_sprite.brain = brain.MONSTER_DIAGONAL
  current_sprite.target = enemy_sprite
  --lock on to the guy who just hit us
  dink.playsound(28, 22050, 6000, current_sprite, false)
end

function talk()
  local randy = dink.random(4, 1)
  if randy == 1 then
    current_sprite:say("`4Gro'k ki owab dakis gedi!")
  elseif randy == 2 then
    current_sprite:say("`4Tig glock sigre!")
  elseif randy == 3 then
    current_sprite:say("`4Oston tewers inat'l meen o mistary!")
  else
    current_sprite:say("`4Hoglim dack byork!")
  end
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
end

function attack()
  dink.playsound(27, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
