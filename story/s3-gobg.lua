local gs = include("en-gs")

local cs

function main()
  gs.main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    defense = 6,
    strength = 25,
    hitpoints = 80,
    touch_damage = 0,
  })

  cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("g", current_sprite, "6")
end

function hit()
  gs.hit()
  current_sprite.touch_damage = 10
end

die = gs.die
attack = gs.attack

function talk()
  if current_sprite.brain == brain.MONSTER_DIAGONAL then
    cs:command("say", "i bey kalling yoo deed!")
    return
  end

  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_in = choice_menu:add_choice("Ask the Goblin guard to let you in")
  choice_in.condition = global.gobpass == 0
  local choice_incident = choice_menu:add_choice("Incite an 'incident'")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()
  dink.wait(400)

  if choice_result == choice_in then
    cs:command("ass", {"d", "g"}, {
      "Greetings my good fellow!  May I enter your fine establishment?",
      "hmm."
    })
    if dink.compare_weapon("item-b1") then
      if global.mayor ~= 3 then
        -- if they have not talked to the mayor, let's not let them in.
        cs:command("ss", "g", "hmm.. are yoo joon?? coom beck lader! too erly")
      else
        -- they are holding the bow
        cs:scene({
          {"w", 0},
          {"ss", "g", "ashee yoo hav bough. GATS OPAN!"},
          {"psound", 43, 22050, 0, nil, false}
        })
        global.gobpass = 1
        local dumb = dink.get_editor_sprite(3).sprite
        dumb.hard = true
        dumb:draw_hard()
        dumb.active = false
      end
    else
      cs:command("ass", {"g", "d"}, {
        "erga hoomans NOT heenter!  leev!",
        "Oh come on, let me in!",
        "no bow?!!! un not joon! leev!!"
      })
    end
  elseif choice_result == choice_incident then
    cs:command("ass", {"d", "g"}, {
      "Say.  So how 'bout that war of '23?  You guys got beat back pretty hard.",
      "yoo ar engerang meee!",
      "I mean, King Daniel basically crushed you all like tiny bugs.",
      "`6reechard!?? yoo wheel bey daying now!"
    })
    current_sprite.brain = brain.MONSTER_DIAGONAL
    current_sprite.target = player
  end

  player:unfreeze()
  current_sprite:unfreeze()
end
