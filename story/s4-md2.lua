function touch()
  player:move_stop(direction.WEST, 397, true)
  player.dir = direction.EAST

  if global.story > 10 then
    current_sprite:say_stop("`6Ahh Dink, thank you, thank you!")
    return
  end

  cutscene.quick_cutscene({d = player, c = current_sprite}, {
    {"ac", "c", "6"},
    {"fz", "d"},
    {"w", 250},
    {"ass", {"c", "d"}, {
      "Who's there?",
      "My name's Dink.",
      {
        "Never mind that.",
        "Do you have food?"
      },
      "Nope ...",
      "I need food!",
      "Sorry ...",
      "`6Then go away!!"
    }},
    {"ufz", "d"}
  })
end
