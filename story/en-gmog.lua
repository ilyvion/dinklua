-- Mog Enemy sprite script
local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.SMART_PEOPLE,
    speed = 1,
    distance = 50,
    range = 45,
    frame_delay = 50,
    timing = 0,
    exp = 150,
    base_walk = 780,
    base_attack = 770,
    defense = 4,
    strength = 20,
    touch_damage = 8,
    hitpoints = 50,
    pframe = 1,
    pseq = 789
  }, {{"c", 770}, {"d", 780}, 785})
end

function hit(enemy_sprite)
  current_sprite.brain = brain.MONSTER_DIAGONAL
  current_sprite.target = enemy_sprite
  --lock on to the guy who just hit us
  dink.playsound(28, 22050, 0, current_sprite, false)
end

function die()
  misc.initialize_sprite(current_sprite, {
    nohit = true,
    touch_damage = 0,
    brain = brain.NONE,
    seq = 0,
    pseq = 785,
    pframe = 1
  })
  dink.unlock_screen()
  player:freeze()

  current_sprite:say_stop("`4Please...")
  dink.wait(500)
  current_sprite:say_stop("`4I will tell you where the secret Cast camp is...")
  dink.wait(1000)
  dink.fade_down()
  dink.wait(2000)
  global.gobpass = 5
  dink.script_attach(1000)

  -- change maps and stuff
  misc.teleport(489, 226, 386)
  dink.draw_status()
  dink.fade_up()
  dink.kill_this_task()
end

function attack()
  dink.playsound(27, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
