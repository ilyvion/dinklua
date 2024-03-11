function main()
  if global.gobpass > 0 then
    -- let's open the gates for them

    -- let all sprites be drawn first
    dink.wait(1)

    local dumb = dink.get_editor_sprite(3).sprite
    dumb.hard = true
    dumb:draw_hard()
    dumb.active = false
  end
end
