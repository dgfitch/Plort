require "lib/load.lua"
require "lib/telescope/telescope"
requireDir "lib/"
requireDir "objects/"

TESTS = {}
last_test = "None"

function love.draw()
  love.graphics.setCaption( 'Plort | FPS: ' .. love.timer.getFPS() )
  if TEST then
    for i,v in ipairs(TESTS) do
      p(v.context .. ": " .. v.name, 30 * i)
    end
  else
    S:draw()
  end
end

function love.update(dt)
  if love.keyboard.isDown( 'escape' ) then
    love.event.push('q')
  elseif TEST and TEST ~= "complete" then
    -- create a test runner with callbacks to show progress and
    -- drop to a debugger on errors
    local contexts = telescope.load_contexts("integration/test.lua")
    telescope.run(contexts, {
      after = function(t) 
        last_test = t 
        table.insert(TESTS, t)
      end,
      error = function(t) debug.debug() end
    })
    print("Tests count is " .. #TESTS)
    TEST = "complete"
  else
    S:update(dt)
  end
end

function love.keypressed(k)
  if S.keypressed then S:keypressed(k) end
end

function love.keyreleased(k)
  if S.keyreleased then S:keyreleased(k) end
end

function love.mousepressed(x,y,b)
  if S.mousepressed then S:mousepressed(x,y,b) end
end

function love.mousereleased(x,y,b)
  if S.mousereleased then S:mousereleased(x,y,b) end
end
