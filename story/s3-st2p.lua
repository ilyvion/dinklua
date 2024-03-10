local items = include("_items")

local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("m", current_sprite, "1")

  if dink.random(3, 1) == 1 then
    cs:command("ss", "m", "Good day sir.")
  end
end

function hit()
  local rcrap = missile_source.pseq
  local used_bow = false
  for i=1,3 do
    used_bow = used_bow or dink.compare_weapon("item-b"..i)
  end
  dink.debug(""..rcrap)
  -- TODO: this value of -1 feels wrong. Validate after being able to
  -- buy the bow.
  if rcrap == -1 and used_bow then
    cs:command("say", "m", "See, now that pierced my lung! Ouch!")
  else
    cs:command("say", "m", "`1That hurts and all, but you could be doing much more damage with a bow!")
  end
end

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_bows = choice_menu:add_choice("Ask about Bows")
  local choice_buy = choice_menu:add_choice("Buy a Bow and some arrows for $1000")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_bows then
    local has_bow = dink.count_item("item-b1")
    if has_bow > 0 then
      cs:command("ass", {"d", "m"}, {
        "Well, you talked me into it and I bought one.",
        "You will love your new bow, sir!",
        "Any tips on using it?",
        {
          "Well... There is an old man who has a place on the beach near",
          "here who can teach you bow lore.  This will give you triple",
          "damage.. when it works."
        },
        "Cool!  How will I know his house?",
        "It's sort of hidden."
      })
    else
      cs:command("ass", {"d", "m"}, {
        "Good day.",
        "To you too sir, I am Arturous, at your service.",
        "Yes well, I was wondering how much you sold your bows for?",
        "My current price for a bow and arrows is 1000 gold.",
        "MAN!  Don't you think that's a little steep??",
        "Not at all, my quality is superb.",
        "Damn better be!"
      })
    end
  elseif choice_result == choice_buy then
    cs:command("ss", "d", "Well, despite the highway robbery, I'd like to get a bow.")
    
    local success, reason = items.try_buy_item(1000, "item-b1", 438, 8, false)
    if success then
      cs:command("ass", {"m", "d"}, {
        "Excellent sir!  I'm sure you won't be disappointed.",
        "Yeah, well I'll let ya know.",
        {
        "One more thing.. if you hold down the button you will draw",
        "your bow back farther, thus hitting harder.  No refunds.  Enjoy!"
        }
      })
    elseif reason == items.REASON_NOT_ENOUGH_GOLD then
      cs:command("ass", {"m", "d"}, {
        "I'm sorry sir, but you DON'T have enough gold!",
        "Whoops, sorry about that."
      })
    end
  end
  player:unfreeze()
  current_sprite:unfreeze()
end
