function damage()
  dink.playsound(18, 8000, 0, nil, false)
  local scrap = current_sprite
  scrap:kill_shadow()
  scrap.seq = 70
  scrap.pseq = 70
  scrap.frame = 1
  scrap.brain = brain.KILL_SEQ_DONE
  local mcrap = scrap.y
  mcrap = mcrap - 35
  scrap.y = mcrap

  mcrap = missile_target.pseq
  scrap = missile_target.pframe
  local hold = missile_target.editor_sprite

  if mcrap == 32 then
    if scrap == 1 then
      -- they hit a tree, lets burn the thing
      missile_target.hard = true
      missile_target:draw_hard()

      local junk = missile_target.script_attached
      if junk > 0 then
        dink.run_script_by_number(junk, "die")
        return
      end

      if hold ~= 0 then
        -- this was placed by the editor, lets make the tree stay burned
        hold.type = editor_type.DRAW_WITH_HARDNESS
        hold.seq = 20
        hold.frame = 29
        -- type means show this seq/frame combo as background in the future
      end

      missile_target.pseq = 20
      missile_target.pframe = 29
      missile_target.hard = false
      missile_target:draw_hard()
      missile_target.seq = 20
      dink.playsound(6, 8000, 0, missile_target, false)
    end
  end
end
