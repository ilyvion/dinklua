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

  local mtarget = dink.get_sprite(global.missile_target)
  mcrap = mtarget.pseq
  scrap = mtarget.pframe
  local hold = mtarget.editor_sprite

  if mcrap == 32 then
    if scrap == 1 then
      -- they hit a tree, lets burn the thing
      mtarget.hard = true
      mtarget:draw_hard()

      local junk = dink.is_script_attached(global.missile_target)
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

      mtarget.pseq = 20
      mtarget.pframe = 29
      mtarget.hard = false
      mtarget:draw_hard()
      mtarget.seq = 20
      dink.playsound(6, 8000, 0, mtarget, false)
    end
  end
end
