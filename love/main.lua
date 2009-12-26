require "lib/load.lua"
require "lib/telescope/telescope"
requireDir "lib/"
requireDir "objects/"

function love.load()
  if TEST then
    states.Test:initialize()
    changeState(states.Test)
  else
    states.Menu:initialize()
    changeState(states.Menu)
  end
end

function love.draw()
  love.graphics.setCaption( 'Plort | FPS: ' .. love.timer.getFPS() )
  S:draw()
end

function love.update(dt)
  if love.keyboard.isDown( 'escape' ) then
    love.event.push('q')
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
