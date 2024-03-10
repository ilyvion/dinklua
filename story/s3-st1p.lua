local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("m", current_sprite, "3")

  if dink.random(3, 1) == 1 then
    cs:scene({
      {"w", 0},
      {"fz", "m"},
      {"ss", "m", "Welcome to our book store sir."},
      {"ufz", "m"}
    })
  end
end

function talk()
  cs:scene({
    {"w", 0},
    {"fza"},
    {"ss", "m", "How may I help you today sir?"}
  })
  
  local choice_menu = dink.create_choice_menu()

  local choice_bookstore = choice_menu:add_choice("Ask about the bookstore")
  local choice_magic = choice_menu:add_choice("Ask about Magic")
  local choice_next_town = choice_menu:add_choice("Find out about the next town")
  local choice_news = choice_menu:add_choice("See what's news")
  
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_bookstore then
    cs:command("ass", {"d", "m"}, {
      "So what do you got here?",
      "We carry books, what did you think?",
      {
        "Mmmmm",
        "Noted."
      }
    })
  elseif choice_result == choice_magic then
    cs:command("ass", {"d", "m"}, {
      "Do you have anything in here on magic?",
      "Magic?  No such thing.",
      "I see... thanks."
    })
  elseif choice_result == choice_next_town then
    if global.mayor >= 6 then
      cs:command("ass", {"d", "m"}, {
        "Did you hear anything about that other town yet?",
        {
          "Yeah actually, a man passed through here this morning,",
          "he said the bridge was back up, so I'm sure you could",
          "head over there and check it out."
        },
        "Okay, thanks."
      })
    else
      cs:command("ass", {"d", "m"}, {
        "Could you tell me about any other cool towns?",
        {
          "There is a neat place east of Terris.",
          "But last I heard the bridge there was out.",
          "I'll let ya know if I hear anything though."
        }
      })
    end
  elseif choice_result == choice_news then
    cs:command("ss", "d", "So what's been going on lately round here?")
    if global.mayor == 6 then
      cs:scene({
        {"ass", {"m", "d"}, {
          {
            "Well, you should know hero!  Thanks for what you did,",
            "the mayor tells me you saved us all."
          },
          {
            "Uh, well .. the mayor exaggerates just a bit,",
            "but yes, it was pretty much me."
          },
          {
            "You're quite the popular guy,",
            "I even heard the mayor's daughter talking about you."
          },
          "Christina, really!??!  What did she say??",
          {
            "Oh, I wasn't really listening that closely,",
            "just heard your name once or twice."
          },
        }},
        {"w", 0},
        {"ss", "d", "Man!!"},
        {"dir", "d", "s"},
        {"ss", "d", "Damn I'm cool!"}
      })
    else
      cs:command("ass", {"m", "d"}, {
        {
          "Not much, everything's been pretty quiet",
          "people are waiting for the parade to happen soon."
        },
        "Oh."
      })
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  current_sprite:freeze()
  current_sprite:say_stop("`3Oh my golly gosh, please don't hurt me mister...")
  current_sprite:unfreeze()
end
