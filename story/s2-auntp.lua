-- script for auntie

local aunt = include("s2-aunt")

function main()
  local jack = nil
  if global["s2-aunt"] < 4 then
    jack = misc.create_sprite_initialized(160, 150, 0, 0, 0, {
      script = "s2-jack"
    })
    dink.wait(5)
  end

  misc.initialize_sprite(current_sprite, {
    base_walk = 250,
    speed = 1,

    -- set starting pic
    pseq = 251,
    pframe = 1
  }, {{"d", 250}})

  local cs = cutscene.create_cutscene(500)
  cs:add_participant("d", player)
  cs:add_participant("m", current_sprite, "#")
  if jack ~= nil then
    cs:add_participant("j", jack, "6")
    aunt.add_punch_commands(cs)
  end

  if global["s2-aunt"] == 0 then
    player:freeze()

    current_sprite.x = 600
    current_sprite.y = -50
    dink.wait(500)
    cs:scene({
      {"ss", "d", "Hello."},
      {"fz", "j"},
      {"ass", {"j", "d"}, {
        "Who the hell are you?",
        "I'm.. I'm Dink Smallwood.  I got a letter and...",
        "I ain't sent no letter to nobody nohow.",
        "But I...",
        "Git outta my house."
      }},
      {"mssw", "m", 430},
      --{"fn", "m", function(m) m.seq = 0 end},
      {"ass", {"m", "d", "j"}, {
        "Dink!  You made it!",
        "Auntie Maria!",
        "What the? How do you know my wife?  You two been cheatin' on me?",
        {
          "Jack, this is my nephew from Stonebrook.",
          "He's going to be staying with us a while."
        },
        {},
        "Huh?  Since when? Gawd dammit!",
        "Dink, I've prepared a room for you upstairs.",
        "Thanks, I'm sure it will be fine.",
        {},
        "Just ask if you need anything."
      }}
    })
    global["s2-aunt"] = 1
    jack:unfreeze()
  elseif global["s2-aunt"] == 2 then
    player:freeze()
    misc.initialize_sprite(current_sprite, {
      hitpoints = 50,
      brain = brain.NONE,
      x = 113,
      y = 180,
      pseq = 259,
    })
    misc.initialize_sprite(jack, {
      brain = brain.NONE,
      x = 154,
      y = 160,
      pseq = 341
    })
    local x, y = current_sprite.x, current_sprite.y - 40
    dink.wait(500)
    cs:scene({
      {"dir", "j", "sw"},
      {"ss", "j", "This will learn you to talk back to me!"},
      {"dir", "d", "w"},
      {"w", 300},
      {"pr", x, y, 22050},
      {"pl", x, y, 22050},
      {"ss", "m", "Please Jack!  Stop..."},
      {"ss", "j", "Shut your trap!"},
      {"pr", x, y, 22050},
      {"ss", "m", "I'm leaving you!  We're through!"},
      {"ss", "j", "Through are we?"},
    })
    local diff_sounds = {
      [3] = 17050,
      [5] = 24050,
      [9] = 17050,
      [11] = 24050,
    }
    cs.wait_time = 50
    for i=1,12 do
      local sound_speed = 22050
      if diff_sounds[i] ~= nil then
        sound_speed = diff_sounds[i]
      end
      local command
      if i % 2 == 1 then
        command = "pl"
      else
        command = "pr"
      end

      cs:command(command, x, y, sound_speed)
    end
    cs.wait_time = 500

    dink.wait(2000)
    cs:command("ss", "j", "You ok, baby?")
    dink.wait(1500)
    global["s2-aunt"] = 3
    cs:command("ss", "j", "You shouldn't make me so mad.")
    dink.wait(500)

    cs:command("ss", "m", "<sob>")
    dink.wait(500)
    jack.brain = brain.SMART_PEOPLE
  end
  player:unfreeze()
  current_sprite.brain = brain.SMART_PEOPLE
end

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("m", current_sprite, "#")
  
  local choice_menu = dink.create_choice_menu()

  local choice_mother = choice_menu:add_choice("Ask about your mother")
  choice_mother.condition = function() return global["s2-aunt"] == 1 end
  local choice_town = choice_menu:add_choice("Ask her about the town")
  choice_town.condition = function() return global["s2-aunt"] == 1 end
  local choice_dump = choice_menu:add_choice("Encourage her to dump Jack")
  choice_dump.condition = function() return global["s2-aunt"] == 3 end
  local choice_beaten = choice_menu:add_choice("Encourage her to continue getting beaten by Jack")
  choice_beaten.condition = function() return global["s2-aunt"] == 3 end
  local choice_comfort = choice_menu:add_choice("Comfort her")
  choice_comfort.condition = function() return global["s2-aunt"] == 4 end
  local choice_bed = choice_menu:add_choice("Ask for a bigger bed")
  choice_bed.condition = function() return global["s2-aunt"] == 4 end
  local choice_adventure = choice_menu:add_choice("Tell Maria about your latest adventure")
  choice_adventure.condition = function() return global["s2-aunt"] == 4 and global.story == 8 end
  local choice_nothing = choice_menu:add_choice("Talk about nothing")
  choice_nothing.condition = function() return global["s2-aunt"] == 5 and global.story <= 15  end
  local choice_brag = choice_menu:add_choice("Brag to Maria about saving the world")
  choice_brag.condition = function() return global.story > 15 end
  
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_mother then
    cs:command("ass", {"d", "m"}, {
      "So how do you know my mom?",
      "Well, she's my sister.",
      "Ah, that explains a few things."
    })
  elseif choice_result == choice_town then
    cs:command("ass", {"d", "m"}, {
      "So tell me about Terris.",
      "It's not a bad town to live in.",
      "You don't sound so enthusiastic.",
      "Well.. things have been rough lately, that's all."
    })
  elseif choice_result == choice_dump then
    cs:command("ass", {"d", "m"}, {
      "I saw Jack hit you.",
      "You.. you did?",
      "Why don't you leave him?  Now?  Tonight?",
      "I'm afraid of him.  He would find me.",
      "Well maybe I'll just have to do something about it myself.",
      "Be careful!  He's very strong,",
      "He ain't nothing, just you watch."
    })
  elseif choice_result == choice_beaten then
    cs:command("ass", {"d", "m"}, {
      "I saw Jack hit you.",
      "You.. you did?",
      "Yes, he's good at it.  I hope to learn much from him.",
      "What?!",
      "I just admire his stroke - takes practice you know."
    })
  elseif choice_result == choice_comfort then
    cs:command("ass", {"d", "m"}, {
      "How are you holding up?",
      "I'm ok.  How do you like our town?  And living here?",
      "I like it.  I think the locals like me too.",
      "I feel safe with you upstairs.",
      "Me too."
    })
  elseif choice_result == choice_bed then
    cs:command("ass", {"d", "m"}, {
      "Say.. I like the room and all, but my bed is a little small.",
      "I would trade, but mine is the exact same size.",
      "What if you traded them in for one big one we could share?",
      "I'm your aunt, Dink!",
      "And?",
      "I have some work I have to do."
    })
  elseif choice_result == choice_adventure then
    cs:command("ass", {"d", "m"}, {
      "Guess what I did today!",
      "Saved Nadine's girl?",
      "Uh, yeah.  How did you know?",
      "It's in the King's News, there is a copy at the healers.",
      "Ah.  Ok."
    })
    global["s2-aunt"] = 5
  elseif choice_result == choice_nothing then
    cs:command("ass", {"d", "m"}, {
      "I just wanted to say, thanks for letting me stay with you.",
      "It's really no problem, Dink.  Have you been looking for a job at all?",
      "Whups, gotta get going!  See ya!"
    })
  elseif choice_result == choice_brag then
    cs:command("ass", {"d", "m"}, {
      "Hey guess what, I just got back from a huge adventure.",
      "That's great.",
      "I pretty much saved the universe.",
      "Uh huh, fine.",
      "You don't believe any of this.",
      "Sorry Dink, I know how young men like to tell tales."
    })

    local choice_menu = dink.create_choice_menu()
    
    local choice_pass = choice_menu:add_choice("Pass off her indifference lightly")
    local choice_rude = choice_menu:add_choice("Get rude about it")

    local choice_result = choice_menu:show()

    if choice_result == choice_pass then
      player:say_stop("Heh - that's what I like about you auntie!")
    elseif choice_result == choice_rude then
      cs:command("ass", {"d", "m"}, {
        "You stupid whore.",
        "Excuse me?",
        {
          "I see now I shouldn't have killed Jack.",
          "I should have joined forces with him."
        }
      })
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  local mcrap = dink.random(4, 1)
  if mcrap == 1 then
    player:say("Take your beatin' like a man, woman!")
  elseif mcrap == 2 then
    current_sprite:say("`#Please.. please don't hit me!")
  elseif mcrap == 3 then
    player:say("I hope you like it rough!")
  else
    player:say("I hate relatives!")
  end
end
