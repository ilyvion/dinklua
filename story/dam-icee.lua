local function whoosh(x, y)
  dink.playsound(18, 8000, 0, nil, false)
  misc.create_sprite_initialized(x, y, brain.KILL_SEQ_DONE, 167, 1, {
    seq = 167
  })
  dink.wait(200)
end

function main()
  dink.wait(1)

  if global.player_map == 579 then
    -- are we about to free the guy from prison?
    local x, y = current_sprite.x, current_sprite.y

    if dink.inside_box(x, y, 300, 195, 388, 244) then
      player:freeze()
      dink.wait(200)
      dink.preload_seq(167)
      whoosh(340, 200)
      whoosh(360, 220)
      whoosh(370, 240)
      whoosh(360, 220)
      whoosh(340, 200)

      local mcrap = current_sprite
      dink.script_attach(1000)

      mcrap.brain = brain.BRAIN_PARM_SIZE_MATCH
      mcrap.brain_parm = 9

      mcrap = dink.get_editor_sprite(22).sprite
      mcrap.hard = true
      mcrap:draw_hard()
      mcrap.active = false
      dink.playsound(43, 22050, 0, nil, false)

      local cs = cutscene.create_cutscene(200)
      cs:add_participant("d", volatile.dude, "5")
      cs:add_participant("p", player)

      cs:scene({
        {"ss", "d", "Woah!"},
        {"mssw", "d", 300},
        {"ss", "d", "Woohoo!  I'm a free man at last!"},
        {"ss", "d", "I must now complete my mission."},
        {"ss", "p", "Mission? To what, destroy the Cast?"},
        {"msnw", "d", 250},
        {"ss", "d", "Actually, it was to stop a freak named Bishop Nelson."},
        {"msw", "d", 80},
        {"ss", "p", "Wait..  I don't understand!"},
        {"ss", "d", "It's best that way.  Now follow me, I'll get you out of here."},
        {"msw", "d", -100},
        {"k", "d"},
        {"ufz", "p"}
      })

      global.caveguy = 5
      dink.kill_this_task()
      return
    end
  end

  dink.wait(5000)

  current_sprite.brain = brain.BRAIN_PARM_SIZE_MATCH
  current_sprite.brain_parm = 9
end
