vim.cmd [[ exec "source" .. stdpath('config') .. '/lua/gnarlyquack/legacy.vim' ]]

require("gnarlyquack.settings")
require("gnarlyquack.keymap")
require("gnarlyquack.lazy")
