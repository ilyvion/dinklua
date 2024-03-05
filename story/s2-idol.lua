function main()
  if global.caveguy > 4 then
    local mcrap = dink.get_editor_sprite(22).sprite
    mcrap.hard = true
    mcrap:draw_hard()
    mcrap.active = false
  end
end

function push()
  player:say("Uh, darn thing won't budge!!")
end
