local cs

local duck1, duck2

local function spawn_duck(x, pseq)
  dink.playsound(24, 22052, 0, nil, false)
  misc.create_sprite_initialized(x, 256, 7, 167, 1, {
    seq = 167
  })
  return misc.create_sprite_initialized(x, 256, 0, 0, 0, {
    brain = brain.DUCK,
    base_walk = 20,
    size = 204,
    -- set starting pic
    pseq = pseq,
    pframe = 1
  })
end

local function spawn_duck1()
  duck1 = spawn_duck(229, 26)
end

local function spawn_duck2()
  duck2 = spawn_duck(428, 24)
end

local function spawn_fireball(x, dir)
  return misc.create_sprite_initialized(x, 256, brain.MISSILE, 506, 1, {
    seq = 510 + dir,
    dir = dir,
    speed = 4,
    flying = true
  })
end

local function execute_attack(victim, fireball_x, dir, concession_text)
  dink.playsound(42, 22050, 0, nil, false)
  local fireball = spawn_fireball(fireball_x, dir)
  dink.wait(570)
  fireball.active = false
  misc.create_sprite_initialized(victim.x, 256, brain.KILL_SEQ_DONE, 168, 1, {
    seq = 70
  })
  dink.playsound(38, 22050, 0, nil, false)
  victim:hurt(10)
  dink.wait(1200)
  victim:say_stop(concession_text)
  victim:hurt(10)
end

local function fight()
  dink.wait(500)
  local pap = dink.random(2, 1)
  if pap == 1 then
    -- Duck 2 WINS
    execute_attack(duck1, 410, direction.WEST, "`3You win this time.")
    return duck2
  else
    -- Duck 1 WINS
    execute_attack(duck2, 240, direction.EAST, "`3You've beaten me.")
    return duck1
  end
end

local function betting()
  if global.gold < 50 then
    cs:command("ss", "q", {
      "Hey, you don't have enough to play!",
      "Come back later."
    })
    cs:command("ufza")
    return
  end

  local winner = "nobody"
  while true do 
    ::continue::

    cs:command("ss", "q", "Place your bets.")
    
    local choice_menu = dink.create_choice_menu()

    local bet
    local choice_50 = choice_menu:add_choice("Bet 50")
    choice_50.on_success = function() bet = 50 end
    local choice_100 = choice_menu:add_choice("Bet 100")
    choice_100.on_success = function() bet = 100 end
    local choice_200 = choice_menu:add_choice("Bet 200")
    choice_200.on_success = function() bet = 200 end
    local choice_stop = choice_menu:add_choice("Stop")
    
    local choice_result = choice_menu:show()

    if choice_result == choice_stop then
      cs:command("ufza")
      return
    end

    if global.gold < bet then
      cs:command("ss", "q", "You can't bet that much.")
      goto continue
    end

    cs:command("ss", "q", "Who are you betting on?")

    choice_menu = dink.create_choice_menu()
    local pick
    local choice_1 = choice_menu:add_choice("Bet on duck 1")
    choice_1.on_success = function() pick = 1 end
    local choice_2 = choice_menu:add_choice("Bet on duck 2")
    choice_2.on_success = function() pick = 2 end
    
    choice_menu:show()

    local pick_text = {
      "one",
      "two"
    }
    cs:command("ss", "d", "Give me number "..pick_text[pick])

    -- Let battle begin...
    cs:command("ss", "q", "The bets are in, let's fight!")

    if winner ~= duck2 then
      spawn_duck2()
    end
    if winner ~= duck1 then
      spawn_duck1()
    end
    if pick == 1 then
      pick = duck1
    else
      pick = duck2
    end

    winner = fight()
    if pick == winner then
      cs:command("ss", "q", "Congratulations!")
      global.gold = global.gold + bet
    else
      cs:command("ss", "q", "Too bad, better luck next time.")
      global.gold = global.gold - bet
    end
  end
end

function main()
  if global.duckgame == 1 then
    global.duckgame = 0
    global.vision = 1

    local pep = misc.create_sprite_initialized(120, 245, 0, 0, 0, {
      brain = brain.DUCK,
      base_walk = 20,
      speed = 1,
      timing = 0,
      size = 204,
      hitpoints = 10,
      -- set starting pic
      pseq = 23,
      pframe = 1,
      script = "s8-duck4"
    })
    
    cs = cutscene.create_cutscene(250)
    cs:add_participant("d", player)
    cs:add_participant("q", pep, "3")

    -- Begin the crack!!
    cs:command("fza")
    cs:command("ss", "q", {
      "Ok Dink, we like our games here bloody,",
      "that's why we have duck fights!!"
    })
    betting()
  end
end
