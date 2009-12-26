require "lib/telescope/telescope"
-- create a test runner with callbacks to show progress and
-- drop to a debugger on errors
local contexts = telescope.load_contexts(file)
local results = telescope.run(contexts, {
 after = function(t) io.stdout:write(t.status_label) end,
 error = function(t) debug.debug() end
})
