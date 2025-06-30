-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup lazy_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | Lazy sync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Install your plugins here
return lazy.setup({
    -- My plugins here

    "folke/lazy.nvim",          -- Manage itself

    "folke/which-key.nvim",     -- Showes what keys do
    "aserowy/tmux.nvim",        -- Allow for c-h to switch tmux or nvim

    "windwp/nvim-autopairs",    -- Autopairs, integrates with both cmp and treesitter
    "numToStr/Comment.nvim",    -- Quickly adds comments to blocks
    "nvim-lua/plenary.nvim",    -- Useful lua functions used by lots of plugins
    "kyazdani42/nvim-tree.lua", -- Useful for a file explorer
    "ahmedkhalf/project.nvim",  -- Maintains a project inside the file explorer

    -- Visual
    "Mofiqul/dracula.nvim",
    "goolord/alpha-nvim",
    "nvim-lualine/lualine.nvim",
    "akinsho/bufferline.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "akinsho/toggleterm.nvim",
    "Pocco81/true-zen.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "catppuccin/nvim",
    { "sphamba/smear-cursor.nvim", opts = { smear_between_neighbor_lines = false }, },
    { "karb94/neoscroll.nvim",     opts = {}, },

    -- Cmp
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").load { paths = "./lua/user/luasnippets" }
        end,
    },
    -- "L3MON4D3/LuaSnip",             -- snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- Vimwiki
    "vimwiki/vimwiki",
    "ElPiloto/telescope-vimwiki.nvim",

    -- LSP
    "neovim/nvim-lspconfig",                              -- enable LSP
    "mason-org/mason.nvim",                               -- simple to use language server installer
    "mason-org/mason-lspconfig.nvim",
    { "danymat/neogen",                  config = true }, -- Generate Docs

    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",


    -- Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-dap.nvim",

    -- Git
    "lewis6991/gitsigns.nvim",

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- AI
    -- {
    --     "olimorris/codecompanion.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         "hrsh7th/nvim-cmp",           -- Optional: For using slash commands and variables in the chat buffer
    --         {
    --             "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
    --             opts = {},
    --         },
    --         "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    --     },
    --     config = true
    -- },
    -- {
    --     "ravitemer/mcphub.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    --     },
    -- }

})
