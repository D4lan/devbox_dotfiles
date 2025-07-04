local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require('dap-go').setup()
--require('go').setup()
require("nvim-dap-virtual-text").setup()
require('telescope').load_extension('dap')
