require "objects/Background.lua"

states.Menu = {
  t = 0,

  draw = function(s)
    p( "PLORT", 100 )
  end,

  update = function(s, dt)
    s.t = s.t + dt
  end,
}

mixin( states.Menu, State )
