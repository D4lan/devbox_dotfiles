-- require("vim.fs")
-- vim.loader.enable()

-- Variables
if (vim.loop.os_uname().sysname == "Windows_NT") then
    HOME = os.getenv("UserProfile")
else
    HOME = os.getenv("HOME")
end
vim.g.homedirvar = HOME

if (os.getenv("USER") == "d4lan") then
    vim.g.computer = "Personal"
else
    vim.g.computer = "Work"
end

-- https://github.com/dgiacomo/Neovim-from-scratch
require "user.options"
require "user.vimwiki"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.file-explorer"
require "user.bufferline"
require "user.neo-scroll"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.indentline"
require "user.alpha"
require "user.utils"
require "user.keymaps"
require "user.whichkey"
require "user.codecompanion"
require "user.tmux"
require "user.true-zen"
require "user.search"
