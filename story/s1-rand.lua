function main()
  if dink.random(8,1) == 1 then
    if dink.random(2,1) == 1 then
      misc.preload_diagonal_seq(340)
      maketraveler(340, 5, "s1-wand")
    else
      misc.preload_diagonal_seq(380)
      maketraveler(380, 2, "s1-wand2")
    end
  end
end

function maketraveler(base_seq, initial_frame, script)
  local spawnx, spawny = dink.random(200,200), dink.random(100, 150)
  misc.create_sprite_initialized(spawnx, spawny, brain.MONSTER_DIAGONAL, base_seq + 1, initial_frame, {
    speed = 1,
    timing = 33,
    brain = brain.SMART_PEOPLE,
    base_walk = base_seq,
    script = script
  })
end
