vim.cmd [[ exec "source" .. stdpath('config') .. '/lua/gnarlyquack/legacy.vim' ]]

require("gnarlyquack.keymap")
require("gnarlyquack.lazy")
