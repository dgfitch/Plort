WIDTH=1024
HEIGHT=768
SIZE=WIDTH/800.0
function love.conf(t)
  t.modules.joystick = false
  t.title = "plort"
  t.author = "Dan Fitch"
  t.screen.width = WIDTH
  t.screen.height = HEIGHT
  t.screen.fullscreen = false
end
