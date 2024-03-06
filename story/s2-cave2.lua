local enemy = include("_enemy")
local misc = include("_misc")

function main()
  if global.caveguy == 5 then
    dink.script_attach(1000)
    dink.preload_seq(375)
    dink.preload_seq(168)
    player:freeze()

    local dude = misc.create_sprite_initialized(551, 157, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 370,
      speed = 2,
      timing = 0,
      -- set starting pic
      pseq = 371,
      pframe = 1
    })

    -- Now EVIL
    local evil = misc.create_sprite_initialized(-20, 130, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 300,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 303,
      pframe = 1
    })

    -- Now EVIL's friend
    local evil2 = misc.create_sprite_initialized(-20, 210, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 300,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 303,
      pframe = 1
    })

    -- And the third EVIL
    local evil3 = misc.create_sprite_initialized(300, 470, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 300,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 307,
      pframe = 1
    })

    local cs = cutscene.create_cutscene()
    cs:add_participant("p", player)
    cs:add_participant("d", dude, "5")
    cs:add_participant("e", evil, "4")
    cs:add_participant("e2", evil2, "4")
    cs:add_participant("e3", evil3, "4")
    
    cs:scene({
      {"pmidi", "1004.mid"},
      {"w", 500},
      {"ss", "d", "Ok, let's get going before they come."},
      {"ss", "d", "This way."},
      {"w", 50},
      {"mvw", "d", 500},
      {"w", 150},
      {"mvw", "p", 550},
      {"w", 0},
      {"ss", "e", "Not so fast."},
      {"w", 850},
      {"mve", "e", 100},
      {"w", 0},
      {"mvn", "e3", 380},
      {"mse", "e2", 67},
      {"ss", "e", "We have a small matter to discuss with your friend."},
      {"say", "e", "Hahahaaahaha"},
      {"say", "e2", "Haha ha ha"},
      {"w", 800},
      {"ss", "e3", "Ha ha haaa"},
      {"w", 0},
      {"dir", "d", direction.SOUTH_EAST},
      {"w", 250},
      {"ss", "d", "It's okay Dink, I can take 'em."},
      {"w", 0},
      {"say", "d", "Allright."},
      {"msw", "d", 400},
      {"dir", "d", direction.SOUTH_WEST},
      {"w", 250},
      {"ss", "d", "Which one of you is first?"},
      {"w", 500},
      {"say", "e2", "Haha ha ha"},
      {"ss", "e3", "Ha ha haaa"},
      {"w", 0},
      {"ss", "e", "I am!!"},
      {"mss", "e", 157},
      {"w", 500},
      {"mse", "e", 170},
    })

    local junk = misc.create_sprite_initialized(240, 157, brain.MISSILE, 506, 1, {
      seq = 506,
      dir = direction.EAST,
      speed = 6,
      flying = true,
    })
    dink.wait(390)
    junk.active = false
    local junk = dink.create_sprite(390, 157, brain.KILL_SEQ_DONE, 168, 1)
    junk.seq = 168
    dude.pseq = 375
    dude.pframe = 1

    dude:say_stop("`5Ahhhhhh!")
    dink.wait(50)
    junk.active = false
    -- Kill guy too
    
    cs:scene({
      {"say", "p", "Noooo!!"},
      {"w", 500},
      {"mvw", "p", 450},
      {"w", 0},
      {"say", "e2", "Haha ha ha"},
      {"w", 500},
      {"ss", "e3", "Ha ha haaa"},
      {"ss", "e", "Our work is done here."},
      {"w", 250},
      {"ss", "e", "You may live, if you forget all that you've seen here."},
      {"w", 500},
      {"ss", "p", "Forget ..."},
      {"w", 250},
      {"ss", "p", "I'll forget allright."},
      {"w", 360},
      {"mvw", "e", -20},
      {"w", 0},
      {"mvw", "e2", -20},
      {"msw", "e3", 180},
      {"mss", "e3", 470},
      {"k", "e"},
      {"k", "e2"},
      {"w", 250},
      {"k", "e3"},
      {"w", 500},
      {"ass", {"p", "d"}, {
        "Forget to remove my foot from your ASS!!",
        {},
        "Are you okay?",
        {
          "I just got hit by a fireball",
          "I'm going to die!"
        },
        "I'm sorry I wasn't fast enough.",
        {
          "It's not your fault",
          "Just .. just be careful... also, take this..."
        },
        "Alright.. what is it?",
        {
          "The Mordavia scroll.  It contains magic I needed to...",
          "Ahhhhhh."
        },
        {},
        {},
        "Ah man..."
      }}
    })
    
    global.caveguy = 6
    dink.add_magic("item-p1", 438, 14)
    global.story = 7

    player:unfreeze()

    dink.fade_down()
    dink.fill_screen(0)

    misc.teleport(625, 268, 173, direction.NORTH)

    dink.fade_up()
    dink.kill_this_task()
  end
end
