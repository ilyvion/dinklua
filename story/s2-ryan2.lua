function main()
  misc.preload_diagonal_seq(370)
  misc.initialize_sprite(current_sprite, {
    base_walk = 370,
    speed = 2,
    timing = 0,
    -- set starting pic
    pseq = 373,
    pframe = 1
  })
  -- Ok Go
  player:freeze()
  current_sprite:say_stop("`2Psst, over here")
  -- Move Dink
  local crap = player.x
  if crap < 340 then
    crap = player.y
    if crap < 210 then
      player:move_stop(direction.SOUTH, 180, 1)
    elseif crap > 210 then
      player:move_stop(direction.NORTH, 180, 1)
    end
    player:move_stop(direction.EAST, 340, 1)
  end
  player:move_stop(direction.WEST, 340, 1);
  player:move_stop(direction.NORTH, 210, 1);
  player:move_stop(direction.WEST, 330, 1);

  cutscene.quick_cutscene({d = player, c = current_sprite}, {
    {"ac", "c", "2"},
    {"ass", {"c", "d"}, {
      "You ready to do this buddy?",
      "Yeah, no problem.",
      "Allright, follow me..."
    }},
    {"msn", "c", 105},
    {"mse", "c", 469},
    {"ss", "c", "In here"},
    {"mse", "d", 510},
    {"ih", false},
    {"msn", "d", 0},
  })
end
