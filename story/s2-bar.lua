-- script for bar and stuff, actually attached to the bench

local barkeep
local temphold2
-- local temphold3

local function mainloop()
  while true do
    dink.wait(3540)
    local myrand = dink.random(8, 1)
    if myrand == 1 then
      barkeep.pseq = 393
    elseif myrand == 2 then
      barkeep.pseq = 391
    end

    if barkeep.custom.guards == 0 then
      myrand = dink.random(37, 1)
      if myrand == 1 then
        barkeep:say_stop_npc("`4Woman, serve those men!")
      elseif myrand == 2 then
        barkeep:say_stop_npc("`4Get to work you stupid wench!")
      end
    end
  end
end

function main()
  barkeep = misc.create_sprite_initialized(390, 120, 0, 0, 0, {
    brain = brain.NONE,
    base_walk = 390,
    speed = 0,

    -- set starting pic
    pseq = 393,
    pframe = 1
  }, {391, 393})
  volatile.barkeep = barkeep
  barkeep.custom.busy = 0
  barkeep.custom.guards = 0

  -- build server girl
  temphold2 = misc.create_sprite_initialized(290, 250, 0, 0, 0, {
    script = "s2-wench"
  })

  -- build old fart 1
  volatile.man1 = misc.create_sprite_initialized(90, 250, 0, 0, 0, {
    script = "s2-man1"
  })

  -- build old fart 2
  misc.create_sprite_initialized(90, 220, 0, 0, 0, {
    script = "s2-man2"
  })

  -- Maybe build Thief
  if global.thief < 2 and dink.random(2, 1) == 1 then
    misc.create_sprite_initialized(560, 248, 0, 0, 0, {
      script = "s2-ryant"
    })
  end

  -- Maybe do cave sequence
  if global.caveguy == 1 then
    barkeep.custom.busy = 1

    dink.script_attach(1000)
    local badguy = misc.create_sprite_initialized(470, 360, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 300,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 303,
      pframe = 1
    }, {{"d", 300}})
    player:freeze()
    cutscene.quick_cutscene({d = player, b = barkeep, c = badguy}, {
      {"ac", "b", "4"},
      {"ac", "c", "4"},
      {"ss", "d", "Hey everybody!"},
      {"msn", "d", 200},
      {"ss", "d", "There's some guy trapped in a dungeon nearby."},
      {"mse", "d", 420},
      {"w", 500},
      {"ss", "d", "I gotta help him!"},
      {"w", 0},
      {"dir", "d", "s"},
      {"w", 250},
      {"ss", "d", "Can anyone help?"},
      {"dir", "d", "w"},
      {"dir", "d", "e"},
      {"dir", "d", "n"},
      {"w", 500},
      {"ss", "b", "There's an old guy in the house south of here."},
      {"ss", "b", "I've heard he knows some magic."},
      {"ss", "b", "Why don't you try asking him?"},
      {"w", 0},
      {"ss", "d", "Ok, thanks."},
      {"msw", "d", 325},
      {"mss", "d", 385},
      {"fn", nil, function() player.disabled = true end},
      {"pmidi", "battle.mid"},
      {"msn", "c", 200},
      {"msw", "c", 325},
      {"ss", "c", "Someone knows."},
      {"ss", "c", "He must die!"},
      {"mss", "c", 420},
      {"k", "c"},
    })
    global.caveguy = 2
    player:unfreeze()
    dink.fade_down()
    dink.fill_screen(0)
    misc.teleport(498, 320, 373)
    player.disabled = false
    dink.draw_status()
    dink.fade_up()
    dink.kill_this_task()
  end

  mainloop()
end

function hit()
  dink.wait(400)
  barkeep:say_stop_npc("`4Trying to break up the place, are ya?")
  dink.wait(800)
  mainloop()
end

function talk()
  barkeep.custom.busy = 1
  player:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_gossip = choice_menu:add_choice("Gossip")
  local choice_threaten = choice_menu:add_choice("Threaten")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_threaten then
    cutscene.quick_cutscene({d = player, b = barkeep}, {
      {"ac", "b", "4"},
      {"w", 400},
      {"ass", {"d", "b"}, {
        "I don't much like you.",
        "And?",
        "I might kill you.",
        "<presses button under the counter>"
      }}
    })

    dink.playmidi("battle.mid")

    -- build guards
    local function make_guard(x, y)
      return misc.create_sprite_initialized(x, y, brain.MONSTER_DIAGONAL, 0, 0, {
        base_walk = 290,
        base_attack = 720,
        speed = 1,
        strength = 10,
        touch_damage = 2,
        timing = 0,
        distance = 50,
        target = player,
        hitpoints = 4
      }, {{"d", 290}, {"c", 720}, 725})
    end
    local crap = make_guard(380, 450)
    crap:freeze()
    crap:move_stop(direction.NORTH_WEST, 250, true)
    
    local jcrap = make_guard(280, 450)
    jcrap:freeze()
    jcrap:move_stop(direction.NORTH_EAST, 400, true)

    barkeep:say_stop("`4Guards!! Help me, destroy this madman!")
    dink.wait(500)
    player.dir = direction.SOUTH
    player:say_stop("Let's play.")

    crap:say("`1Attack him!")
    crap:unfreeze()
    jcrap:unfreeze()

    crap.script = "s2-fight"
    jcrap.script = "s2-fight"
    -- Phoenix: fix for the barfight
    barkeep.custom.guards = 2
  elseif choice_result == choice_gossip then
    dink.wait(400)
    player:say_stop("Any news, Barkeep?")
    dink.wait(400)

    if global.story < 8 then
      barkeep:say_stop("`4Well.. Nadine's little girl is missing.  That's about it.")
      dink.wait(400)
      player:say_stop("Really?")
      dink.wait(400)
      barkeep:say_stop("`4Yep.")
    else
      barkeep:say_stop("`4Nice job on saving Nadine's little girl.  You are something of a...")
      dink.wait(400)
      barkeep:say_stop("`4hero around here.  Oh, and my employees are lazy, that's about it.")
    end
  end

  barkeep.custom.busy = 0
  player:unfreeze()
  mainloop()
end
