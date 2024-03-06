function main()
  if global.caveguy > 4 then return end

  player:freeze()
  local dude = misc.create_sprite_initialized(464, 116, 0, 0, 0, {
    brain = brain.NONE,
    base_walk = 370,
    speed = 2,
    timing = 0,
    -- set starting pic
    pseq = 373,
    pframe = 1,
    dir = direction.SOUTH
  })

  local cs = cutscene.create_cutscene(300)
  cs:add_participant("d", dude, "5")
  cs:add_participant("p", player)

  cs:add_actor_command("b4w", function(_, actor, return_dir, message)
    actor.dir = direction.SOUTH
    dink.wait(750)
    if message ~= nil then
      actor:say_stop(message)
    end
    actor.dir = return_dir
    dink.wait(200)
  end)

  if global.caveguy == 0 then
    cs:scene({
      {"ss", "d", "Help me!"},
      {"w", 0},
      {"ss", "p", "The hell!?!"},
      {"mse", "p", 130},
      {"msse", "p", 190},
      {"mse", "p", 300},
      {"ss", "p", "What's your problem?"},
      {"mssw", "d", 400},
      {"w", 300},
      {"ass", {"d", "p"}, {
        "They threw me in here",
        {
          "Huh",
          "Who threw you in here?"
        },
        "They did, agents of the Cast."
      }},
      {"b4w", "p", direction.EAST, "Is he telling the truth?"},
      {"ass", {"p", "d"}, {
        "You probably deserved it...",
        "No, actually I didn't.",
        "Oh.",
        {
          "Now will you help me get outta here!",
          "They'll be back here soon, they'll kill us both!",
        },
        "Ok ok, how do I get you out?",
        {
          "I'm not sure.  That statue seems to keep me in.",
          "I think it's protected with magic.",
          "You know any, kid?"
        },
        "Hmm, just my fireball spell.",
        {
          "I don't think that'll cut it.",
          "Try in town, someone there's gotta know something."
        },
        "Ok... by the way, my name is Dink.  Goodbye for now."
      }},
    })
    global.caveguy = 1
  elseif global.caveguy == 1 then
    cs:scene({
      {"ss", "d", "Any luck?"},
      {"w", 0},
      {"mse", "p", 130},
      {"w", 300},
      {"ss", "p", "Uh, working on that."},
      {"ss", "d", "Hurry!!"},
      {"b4w", "p", direction.EAST},
      {"ss", "p", "Noted."},
    })
  elseif global.caveguy == 2 then
    cs:scene({
      {"ss", "d", "Any luck yet?"},
      {"w", 0},
      {"mse", "p", 130},
      {"w", 300},
      {"ss", "p", {
        "There's some old man in town who knows some magic.",
        "He might have a spell that could help us."
      }},
      {"b4w", "d", direction.WEST},
      {"ass", {"d", "p"}, {
        "THEN WHAT THE HELL ARE YOU DOING HERE?",
        "Oh yeah, sorry."
      }}
    })
  elseif global.caveguy == 3 then
    cs:scene({
      {"ss", "d", "Any luck YET!?"},
      {"w", 0},
      {"mse", "p", 130},
      {"w", 300},
      {"ss", "p", {
        "The damn old man says I'm not powerful enough yet",
        "so I'm trying to raise my skills now."
      }},
      {"b4w", "d", direction.WEST},
      {"ass", {"d", "p"}, {
        {
          "Well hey that's great.",
          "I'll just be DYING here and hope those agents don't come back!!"
        },
        "Ok, ok I'm on it.."
      }}
    })
  elseif global.caveguy == 4 then
    cs:scene({
      {"ss", "d", {
        "I'm going to die soon, I just know it.",
        "Any luck!?!"
      }},
      {"w", 0},
      {"mse", "p", 130},
      {"w", 300},
      {"ass", {"p", "d"}, {
        "I got the spell, so let's see if it works.",
        {
          "All right!!",
          "Hurry though, I could've sworn I heard something just before you came."
        },
        "Ok."
      }}
    })
  end

  player:unfreeze()
end
