-- script for slayer-little girl cult

function main()
  if global["s2-nad"] ~= 2 then
    dink.wait(1000)

    if global["s2-nad"] < 3 then
      player:say("What a lovely backyard.")
    elseif global["s2-nad"] > 2 then
      player:say("Ah, the memories.")
    end

    return
  end

  misc.preload_diagonal_seq(530)
  misc.preload_diagonal_seq(550)
  misc.preload_cardinal_seq(540)
  misc.preload_cardinal_seq(330)

  -- build little girls
  local girl1 = misc.create_sprite_initialized(265, 176, 0, 0, 0, {
    base_walk = 330,
    speed = 1,
    pseq = 333,
    pframe = 1
  })
  local girl2 = misc.create_sprite_initialized(383, 179, 0, 0, 0, {
    base_walk = 330,
    speed = 1,
    pseq = 331,
    pframe = 1
  })
  local girl3 = misc.create_sprite_initialized(229, 278, 0, 0, 0, {
    base_walk = 330,
    speed = 1,
    pseq = 339,
    pframe = 1
  })
  local girl4 = misc.create_sprite_initialized(393, 278, 0, 0, 0, {
    base_walk = 330,
    speed = 1,
    pseq = 337,
    pframe = 1
  })

  player:freeze()

  local cs = cutscene.create_cutscene(500)
  cs:add_participant("d", player)
  cs:add_participant("g1", girl1, "#")
  cs:add_participant("g2", girl2, "#")
  cs:add_participant("g3", girl3, "#")
  cs:add_participant("g4", girl4, "#")

  cs:scene({
    {"w", 0},
    {"mvw", "d", 583},
    {"w", 500},
    {"ss", "g1", "I love you, Dead Dragon Carcass."},
    {"ss", "g2", "I worship you, Dead Dragon Carcass."},
    {"ss", "g3", "I would kill for you, Dead Dragon Carcass"},
    {"ss", "g4", "I would do anything for you, DDC."},
    {"ss", "g1", "Please Cindy, say the whole name each time."},
    {"ss", "g4", "Fine."},
    {"ss", "g4", "I would do anything for you, DEAD DRAGON CARCASS."},
    {"ss", "d", "Interesting little party we've got here..."}
  })

  misc.preload_diagonal_seq(340)
  local nelson = misc.create_sprite_initialized(329, 450, 0, 0, 0, {
    base_walk = 340,
    speed = 1,
    pseq = 349,
    pframe = 1
  })
  volatile.nelson = nelson
  cs:add_participant("n", nelson, "4")
  cs:scene({
    {"msn", "n", 320},
    {"ss", "n", "How goes the Dead Dragon Carcass worshipping, girls?"},
    {"ss", "g1", "Wonderful - thank you for showing us the light, Bishop Nelson!"},
    {"ss", "n", "Guess what, I have a little surprise for you today."},
    {"ss", "g4", "More goat blood?"},
    {"ss", "n", "No, Cindy."},
    {"ss", "n", "We have a new member.  Come on out, Mary!"}
  })

  local mary = misc.create_sprite_initialized(300, 450, 0, 0, 0, {
    base_walk = 330,
    speed = 1,
    pseq = 337,
    pframe = 1
  })
  volatile.mary = mary
  cs:add_participant("m", mary, "#")
  cs:scene({
    {"msn", "m", 360},
    {"ss", "m", "Please!  I don't want to join your cult!"},
    {"ss", "n", "You WILL learn to love the Dead Dragon Carcass, Mary."},
    {"ss", "m", "How can you worship a rotting corpse?!"},
    {"ss", "g1", "`#I think the Carcass would appreciate another sacrifice, Bishop Nelson."},
    {"ss", "n", "Excellent point, Jennifer."}
  })

  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title_color = 10
  choice_menu.title = "A girl is about to die in a cult ritual.  What do you do?"

  local choice_save = choice_menu:add_choice("Say something to the effect that you are going to save her")
  local choice_agree = choice_menu:add_choice("Agree that Mary should be sacrificed")
  local choice_hidden = choice_menu:add_choice("Use brains and stay hidden")
  
  local choice_result
  while true do
    choice_result = choice_menu:show()

    if choice_result == choice_hidden then
      dink.wait(200)
      cs:scene({
        {"w", 250},
        {"dir", "d", "s"},
        {"ss", "d", "Nah, I think I'd rather shout something."},
        {"dir", "d", "w"}
      })
    else
      break
    end
  end

  if choice_result == choice_save then
    cs:scene({
      {"ss", "d", "Excuse me?"},
      {"ss", "g1", "There is a man hiding in the bushes!"},
      {"ss", "d", "Get your hands off her, Nelson!  She's coming with me!"},
      {"ss", "n", "I don't think so, Smallwood."},
      {"msw", "d", 470},
      {"ss", "n", "Girls!  This man is a lunatic - turn on him and destroy him!"}
    })
  elseif choice_result == choice_agree then
    cs:scene({
      {"ss", "d", "I agree, crucify the new girl!"},
      {"ss", "g1", "There is a man hiding in the bushes!"},
      {"ss", "d", "I just adore your sadistic rituals.  May I continue to watch?"},
      {"ss", "n", "Come here, child."},
      {"msw", "d", 470},
      {"ss", "d", "Ahh, this is a much better view."}
    })
  end

  dink.preload_seq(167)
  cs:scene({
    {"ss", "n", "The Dead Dragon Carcass is calling for a sacrifice..."},
    {"ss", "n", "HIM!"},
    {"ss", "g1", "Girls, Transform"}
  })

  dink.lock_screen()
  player:unfreeze()

  nelson.brain = brain.SMART_PEOPLE
  nelson.script = "s2-cman"

  mary.brain = brain.SMART_PEOPLE
  mary.script = "s2-culg"

  function convert(girl, x, y)
    dink.playsound(24, 22052, 0, nil, false)
    misc.create_sprite_initialized(x, y, brain.KILL_SEQ_DONE, 167, 1, {
      seq = 167,
    })
    girl.script = "s2-cbon"
    dink.wait(800)
  end

  convert(girl1, 265, 176)
  convert(girl2, 383, 179)
  convert(girl3, 229, 278)
  convert(girl4, 393, 278)

  nelson:say_stop("`4You see, my girls are more than meets the eye.")
  -- haha, transformers reference

  dink.playmidi("denube.mid")
end
