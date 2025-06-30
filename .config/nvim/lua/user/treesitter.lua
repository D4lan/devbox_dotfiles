local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "go",
        "gomod",
        "nix",
        "lua",
        "markdown",
        "python",
        "vimdoc",
        "vim",
        "html",
        "json",
        "javascript",
        "yaml",
        "bash",
        "tmux",
        "dockerfile",
        "terraform",
        "typescript",
        -- "norg",
    },
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        -- disable = { "python", "css" }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})
