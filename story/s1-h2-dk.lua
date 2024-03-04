function talk()
  player:say("I knew you'd come back.")
end

function die()
  local ethel = dink.get_editor_sprite(23).sprite
  global.old_womans_duck = 5
  cutscene.quick_cutscene({d = player, e = ethel}, {
    {"w", 500},
    {"fz", "d"},
    {"w", 250},
    {"ac", "e", "3"},
    {"ass", {"e","d"}, {
      {
        "Dink, noooooooo!!!",
        "You little bastard!!",
        "Get out!!"
      },
      "Uh, sorry."
    }},
    {"ufz", "d"}
  })
end
