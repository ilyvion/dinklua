function hit()
  local randy = dink.random(3, 1)
  if randy == 1 then
    current_sprite:say("`4Kill him, Girls!")
  elseif randy == 2 then
    current_sprite:say("`4Judgement day has cometh, sinner!")
  else
    current_sprite:say("`4The girls are hungry - DINNER TIME!")
  end
end

function talk()
  local randy = dink.random(3, 1)
  if randy == 1 then
    current_sprite:say("`4You made a mistake coming here.")
  elseif randy == 2 then
    current_sprite:say("`4Your blood will flow like the river Jordan.")
  else
    current_sprite:say("`4Can I interest you in our love gift for December?  Only $80!")
  end
end
