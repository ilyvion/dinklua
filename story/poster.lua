function talk()
  player:freeze()

  local cs = cutscene.create_cutscene(300)
  cs:add_participant("d", player)
  cs:add_participant("p", current_sprite, "%")

  if global.story < 8 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 43.",
        "A young man by the name of Milder Flatstomp has won the King's",
        "jousting tournament."
      },
      "What?!  Whatever!"
    })
  elseif global.story == 8 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 44.",
        "Milder Flatstomp is knighted by King Daniel for his part in uncovering",
        "a Cast plot!"
      },
      {},
      "Also in the news:  A pig farmer named Dink Smallwood found a lost Terris girl.",
      "Pig farmer!? What a crock.  At least I'm on there though.",
      "Also:  The town of Kernsin is having a festival, all invited."
    })
  elseif global.story == 9 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 45.",
        "The famous Knight Milder Flatstomp has wed!",
      },
      "Flatstomp got married?  Wow, small world.",
      "King Daniel wishes Milder and Lyna (the lucky maiden) well.",
      "LYNA? NOOO!!!",
      "Also:  The town of KernSin is having a parade today."
    })
  elseif global.story == 10 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 46.",
        "Dink Smallwood saves KernSin and foils the Cast!",
      },
      "Yeah!!!!!",
      "Also in the news:  Windemere Village experiences a famine.",
    })
  elseif global.story == 11 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 47.",
        "The Knight Milder Flatstomp ventures into The Darklands - hunting the Cast.",
      },
      "Big freakin' deal.",
      {
        "Also:  Hero Smallwood saves Windemere Village from famine!  He reportly",
        "taught them proper agricultural procedure he learned pig farming in Stonebrook."
      },
      "Arg! Oh well, close enough."
    })
  elseif global.story == 12 or global.story == 13 then
    cs:command("ass", {"p", "d"}, {
      {
        "The King's News, issue 48.",
        "Sir Flatstomp is declared missing in the Darklands!",
        "'Tis a sad day for our country' - King Daniel"
      },
      "Wow.. Poor Milder...he really wasn't such a bad guy.",
    })
  elseif global.story == 14 then
    cs:command("ss", "p", {
      "The King's News, issue 49.",
      "King Daniel sends Dink Smallwood to rescue Sir Milder!",
      "'Smallwood is brave, I'll give him that.' - King Daniel"
    })
  elseif global.story == 15 then
    cs:command("ss", "p", {
      "The King's News, issue 50.",
      "Smallwood has returned from the Darklands!",
      "'I can't wait until he gets to the castle!' - King Daniel"
    })
  elseif global.story == 16 then
    cs:command("ss", "p", {
      "The King's News, issue 51.",
      "Smallwood for King!  Read all about it!",
      "'You've won the game, please don't take my throne too!' - King Daniel"
    })
  else
    cs:command("ss", "p", {
      "The King's News, issue 76.",
      "No news to report."
    })
  end

  player:unfreeze()
end
