states.Game = {
  initialize = function(s, level)
    love.mouse.setVisible( false )
  end,

  draw = function(s)
  end,

  update = function(s, dt)
  end,

  keypressed = function(s, k)
    --debugging yay
    if k == '1' then
      s:nextLevel()
    end
  end,

  mousepressed = function(s, x, y, b)
    if b == 'r' then
      s.cursor:clickr( x, y )
    elseif b == 'l' then
      s.cursor:click( x, y )
    end
  end,

  mousereleased = function(s, x, y, b)
    if b == 'l' then
      s.cursor:disconnect()
    end
  end,
}

mixin( states.Game, State )

