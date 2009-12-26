states.Test = {
  results = {},

  initialize = function(s, level)
    local contexts = telescope.load_contexts("integration/test.lua")
    telescope.run(contexts, {
      after = function(t) 
        last_test = t 
        print(string.format("%s: %s", t.context, t.name))
        if t.message then
          printAll(t.message, "failure")
        end
        table.insert(s.results, t)
      end,
      -- Not sure how to make this work inside love
      error = function(t) debug.debug() end
    })
  end,

  draw = function(s)
    for i,v in ipairs(s.results) do
      if v.status_label == "?" then
        love.graphics.setColor(255,255,100)
      elseif v.status_label == "F" then
        love.graphics.setColor(255,100,100)
      elseif v.status_label == "T" then
        love.graphics.setColor(100,255,100)
      else
        love.graphics.setColor(255,255,255)
      end
      p(string.format("%s: %s", v.context, v.name), 20 * i)
    end
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

mixin( states.Test, State )


