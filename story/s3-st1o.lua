function main()
  if global.mayor == 1 then
    local woman = misc.create_sprite_initialized(29, 320, 0, 0, 0, {
      brain = brain.SMART_PEOPLE,
      base_walk = 250,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 253,
      pframe = 1
    })
    -- Start stuff
    cutscene.quick_cutscene({d = player, w = woman}, {
      {"fza"},
      {"ac", "w", "9"},
      {"ss", "w", "Over here."},
      {"wn", 250},
      {"mse", "w", 150},
      {"msne", "w", 264},
      {"msn", "w", 180},
      {"ss", "w", "The mayor's sometimes in here."},
      {"wn", 250},
      {"ss", "w", "If what you say is true, you have to go and talk to him."},
      {"mss", "d", 332},
      {"msn", "d", 331},
      {"mse", "d", 140},
      {"msne", "d", 285},
      {"dir", "d", "w"},
      {"w", 250},
      {"ass", {"d", "w"}, {
        {
          "Ok, I'll do it.",
          "What are you gonna do?"
        },
        {
          "I'll head back to the fountain and warn people.",
          "Good luck."
        }
      }},
      {"mssw", "w", -20},
      {"ufza"},
      {"k", "w"},
    })
    global.mayor = 2
  end
end
