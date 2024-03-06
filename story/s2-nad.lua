-- script for aunts house

function main()
  -- build aunt
  misc.create_sprite_initialized(290, 250, 0, 0, 0, {
    script = "s2-nadp"
  })

  if global["s2-nad"] > 2 then
    -- build little girl
    misc.create_sprite_initialized(390, 210, 0, 0, 0, {
      script = "s2-qgirl"
    })
  end
end
