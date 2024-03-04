function talk()
  local text = "`%To Windemere Village"
  if global.story < 10 then
    text = text.."      Note:  Bridge Out"
  end
  current_sprite:say(text)
end
