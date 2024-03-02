function main()
  if global.nuttree == 1 then
    local lyna = dink.get_editor_sprite(6).sprite
    local cs = cutscene.create_cutscene()
    cs:add_participant("d", player)
    cs:add_participant("m", current_sprite, "6")
    cs:add_participant("l", lyna, "4")
    cs:scene({
      {"w", 1000},
      {"fza"},
      {"w", 500},
      {"ss", "d", "Hey, that's Lyna with Milder Flatstomp!"},
      {"w", 250},
      {"ass", {"m", "l"}, {
        "You know I love you baby... so what's the problem?",
        {
          "Milder... I want to get to know you first.",
          "I have a mind too, you know."
        },
        "You kinda talk too much, you know that?",
        "You're an ass!"
      }},
      {"w", 0},
      {"ufz", "l"},
      {"mss", "l", 334},
      {"msw", "l", -10},
      {"k", "l"},
      {"ss", "m", "Hhhmph,  chicks!"},
      {"ufz", "m"},
      {"msw", "m", 84},
      {"msn", "m", -10},
      {"k", "m"},
      {"ufz", "d"},
    })
    global.nuttree = 2
  end
end
