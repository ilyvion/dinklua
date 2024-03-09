local cs

function main()
  misc.preload_diagonal_seq(360)
  volatile.mother = current_sprite
  misc.initialize_sprite(current_sprite, {
    base_walk = 360,
    speed = 1,

    -- set starting pic
    pseq = 361,
    pframe = 1,
    brain = brain.SMART_PEOPLE
  })

  cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("n", current_sprite, "5")
end

local choice_menu = dink.create_choice_menu()
local choice_dirty     = choice_menu:add_choice("Ask Nadine why her house is such a mess", function() return global["s2-nad"] == 0 end)
local choice_find      = choice_menu:add_choice("Offer to find Nadine's girl", function() return global["s2-nad"] == 1 end)
local choice_rude      = choice_menu:add_choice("Be rude to Nadine", function() return global["s2-nad"] == 1 end)
local choice_fruitless = choice_menu:add_choice("Let her know exactly how fruitless your search has been thus far", function() return global["s2-nad"] == 2 end)
local choice_doing     = choice_menu:add_choice("Ask Nadine how she and Mary are doing", function() return global["s2-nad"] == 3 end)
local choice_leave     = choice_menu:add_choice("Leave")

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local choice_result = choice_menu:show()

  if choice_result == choice_dirty then
    cs:scene({
      {"ass", {"d", "n"}, {
        "Hi Nadine.  I'm new to town.  Why is your house a pig pen?",
        "Since my little girl was kidnapped, I've sort of let things go.",
        "Kidnapped?!  Why aren't the townspeople forming a search party?",
        "They don't care.  We are poor."
      }}
    })
    global["s2-nad"] = 1
  elseif choice_result == choice_find then
    cs:scene({
      {"ass", {"d", "n"}, {
        "Nadine - I care nothing about your personal finance.  I will help you.",
        "You.. you will?",
        "Of course.  What was the dear thing's name?",
        "Mary.  Her name was Mary.",
        "Do you have any idea of who may have taken her?",
        "No.. no I don't.",
        "Well damn."
      }}
    })
    global["s2-nad"] = 2
  elseif choice_result == choice_rude then
    cs:scene({
      {"ass", {"d", "n"}, {
        "Nadine - if you had some cash saved, I would find your girl.",
        "You know I don't have anything!  Look at my pantry!",
        "No thanks.  Also, your arms look pointy and stupid.",
        "How dare you!"
      }}
    })
  elseif choice_result == choice_fruitless then
    cs:scene({
      {"ass", {"d", "n"}, {
        "Little Mary is still out there, somewhere.",
        "She must be so afraid and lonely out there!",
        "Yes.. unless she was kidnapped by really nice people.",
        "Please leave now."
      }}
    })
  elseif choice_result == choice_doing then
    cs:scene({
      {"ass", {"d", "n"}, {
        "Say, how are you and the little tike doing?",
        "Great!",
        "I see you have not had time to clean the house...",
        "Mary just came home!  We can do that stuff later."
      }}
    })
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  player:say("How does it feel?!")
end
