states.Test = {
  results = {},
  active = nil,
  vis_size = 10,
  vis_padding = 2,
  x = 0,
  y = 0,

  initialize = function(s, level)
    local contexts = telescope.load_contexts("integration/test.lua")
    telescope.run(contexts, {
      after = function(t) 
        last_test = t 
        print(string.format("%s: %s", t.context, t.name))
        printAll(t, "test table")
        if t.message then
          printAll(t.message, "failure")
        end
        if not s.results[t.context] then
          s.results[t.context] = {}
        end
        if not s.active then s.active = t.context end
        table.insert(s.results[t.context], t)
      end,
      -- Not sure how to drop to a debugger from inside love
      error = function(t) debug.debug() end
    })
  end,

  draw = function(s)
    local context_index = 0
    local vis = s.vis_padding + s.vis_size
    for context_name,context in pairs(s.results) do
      context_index = context_index + 1
      local ry = vis * context_index + 10
      love.graphics.setColor(255,255,255)
      love.graphics.printf(context_name, vis, ry + 10, WIDTH, "left")
      for i,v in ipairs(context) do
        if v.status_label == "?" then
          love.graphics.setColor(255,255,100)
        elseif v.status_label == "F" then
          love.graphics.setColor(255,100,100)
        elseif v.status_label == "T" then
          love.graphics.setColor(100,255,100)
        else
          love.graphics.setColor(100,255,100)
        end
        local rx = vis * i + 50
        love.graphics.rectangle('fill',rx,ry,s.vis_size,s.vis_size)
        -- NOTE: no idea why I have to mangle ry to get this click-focus working
        if s.x >= rx and s.x <= rx + s.vis_size and s.y >= (ry - s.vis_size - 4) and s.y <= (ry - 4) then
          local msg = string.format("%s: %s (%s assertions)", v.context, v.name, v.assertions_invoked)
          if v.message then
            msg = msg .. "\n" .. dumpAll(v.message, "failure")
          end
          love.graphics.printf(msg, vis, 200, WIDTH, "left")
          love.graphics.setColor(255,240,200)
          love.graphics.rectangle('line',rx,ry,s.vis_size,s.vis_size)
        end
      end
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
    if b == 'l' then
      s.x = x
      s.y = y
    end
  end,

  mousereleased = function(s, x, y, b)
  end,
}

mixin( states.Test, State )


