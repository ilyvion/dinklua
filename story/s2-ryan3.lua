function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    base_walk = 370,
    speed = 2,
    timing = 0,

    -- set starting pic
    pseq = 377,
    pframe = 1
  }, {{"d", 370}})
  -- Ok Go
  local cs = cutscene.create_cutscene()
  cs:add_participant("d", player)
  cs:add_participant("r", current_sprite, "2")

  cs:scene({
    {"fz", "d"},
    {"msn", "r", 375},
    {"msw", "r", 300},
    {"msn", "r", 350},
    {"msn", "d", 330},
    {"ss", "r", "Ok, it's up here"},
    {"msn", "r", 200},
    {"ss", "r", "Follow me..."},
    {"mse", "r", 399},
    {"msn", "r", 165},
    {"w", 100},
    {"psound", 19, 22052, 0, nil, false},
    {"psound", 19, 44102, 0, nil, false},
    {"w", 0},
    {"psound", 19, 44102, 0, nil, false},
    {"say", "r", "Now if I can just pick this lock..."},
    {"msn", "d", 190},
    {"mse", "d", 350},
    {"ss", "d", "What are we doing?"},
    {"w", 100},
    {"psound", 19, 44102, 0, nil, false},
    {"w", 0},
    {"psound", 19, 44102, 0, nil, false},
    {"ss", "r", "Just one more second..."},
    {"pmidi", "battle.mid"}
  })
  
  local function make_guard(x, y)
    return misc.create_sprite_initialized(x, y, brain.MONSTER_DIAGONAL, 0, 0, {
      base_walk = 290,
      base_attack = 720,
      speed = 1,
      strength = 10,
      touch_damage = 2,
      timing = 0,
      target = player,
      hitpoints = 40,
      distance = 50,
    }, {{"d", 290}, {"c", 720}, 725})
  end

  local crap = make_guard(380, 450)
  crap:freeze()
  crap:move(direction.NORTH_WEST, 250, true)

  local jcrap = make_guard(280, 450)
  jcrap:freeze()
  jcrap:move(direction.NORTH_EAST, 400, true)

  cs:scene({
    {"w", 250},
    {"ss", "r", "Oh no, guards!!  Run for it!"},
    {"w", 0},
    {"dir", "d", "s"},
    {"ss", "d", "This ain't good."},
  })

  global.thief = 3
  player:unfreeze()
  jcrap:unfreeze()
  crap:unfreeze()

  current_sprite:move_stop(direction.EAST, 700, true)
  current_sprite.active = false
end
