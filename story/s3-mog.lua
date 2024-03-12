function main()
  player:freeze()
  dink.playmidi("1009.mid")
  dink.wait(500)
  player:say_stop("All this killing and still no answers.")

  local crap = misc.create_sprite_initialized(317, 301, 0, 0, 0, {
    script = "en-gmog",
    target = player,
    brain = brain.MONSTER_DIAGONAL,
  })

  cutscene.quick_cutscene({d = player, m = crap}, {
    {"fz", "m"},
    {"w", 500},
    {"ac", "m", "4"},
    {"ass", {"m", "d"}, {
      "Who dares wake the mighty Mog, king of Goblins?",
      "What's this?  You have learned our tongue well, Mog.",
      "Of course.  I was raised by.. what is this?  My comrades litter the ground!",
      {
        "It was I who fell them.",
        "NOW TELL ME OF YOUR SECRET DEALINGS WITH THE CAST!"
      },
      "You?  YOU?  I MUST AVENGE MY BROTHERS!"
    }},
    {"ufza"}
  })
  dink.lock_screen()
end
