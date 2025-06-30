local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end


-- Configs
which_key.setup({
    preset = "classic",
    plugins = {
        marks = false,        -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    win = {
        title = false,
        no_overlap = false,              -- don't allow the popup to overlap with the cursor
        border = "rounded",              -- none, single, double, shadow
        padding = { 2, 2, 2, 2 },        -- extra window padding [top, right, bottom, left]
        height = { min = 10, max = 25 }, -- min and max height of the columns
        wo = {
            winblend = 0,
        }
    },

    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        mappings = false,
    },
    keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    layout = {
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
    },
    show_help = true,                   -- show help message on the command line when the popup is visible
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
})

which_key.add({
    {
        mode = { "n" },
        nowait = true,
        remap = false,
        -- Mappings without a group
        {
            { "<leader><leader>", "<cmd>nohlsearch | ccl<CR>",                                                                                      desc = "No Highlight or Quickfix" },
            { "<leader>b",        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
            { "<leader>e",        "<cmd>NvimTreeToggle<cr>",                                                                                        desc = "Explorer" },
            { "<leader>s",        "<cmd>set spell!<cr>",                                                                                            desc = "Spelling" },
            { "<leader>q",        "<cmd>q!<CR>",                                                                                                    desc = "Quit" },
            { "<leader>x",        "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",                                                                               desc = "Close Buffer" },
            { "<leader>P",        "<cmd>lua require('telescope').extensions.projects.projects()<cr>",                                               desc = "Projects" },
            { "<leader>z",        "<cmd>TZAtaraxis<CR>",                                                                                            desc = "Zen Mode" },

        },

        -- AI
        {
            { "<leader>a",  group = "AI" },
            { "<leader>aa", "<cmd>CodeCompanionActions<CR>",     desc = "Actions" },
            { "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
        },

        -- Comment
        {
            { "<leader>c",  group = "Comment" },
            { "<leader>cO", "<cmd>lua require 'Comment.api'.insert.linewise.above()<CR>",    desc = "Comment Above" },
            { "<leader>ca", "<cmd>lua require 'Comment.api'.insert.linewise.eol()<CR>",      desc = "Comment End of Line" },
            { "<leader>cb", "<cmd>lua require 'Comment.api'.toggle.blockwise.current()<CR>", desc = "Comment Block" },
            { "<leader>cc", "<cmd>lua require 'Comment.api'.toggle.linewise.current()<CR>",  desc = "Comment Line" },
            { "<leader>cd", "<cmd>lua require 'Comment.api'.toggle.linewise.current()<CR>",  desc = "Comment Line" },
            { "<leader>co", "<cmd>lua require 'Comment.api'.insert.linewise.below()<CR>",    desc = "Comment Below" },
        },

        -- Debugger
        {
            { "<leader>d",  group = "DAP Debugger" },
            { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
            { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
            { "<leader>df", "<cmd>DapUiFloat<cr>",          desc = "UI Float" },
            { "<leader>dg", "<cmd>GoDebug<cr>",             desc = "Go Debug" },
            { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step Into" },
            { "<leader>do", "<cmd>DapStepOver<cr>",         desc = "Step Over" },
            { "<leader>dr", "<cmd>DapRerun<cr>",            desc = "Rerun" },
            { "<leader>ds", "<cmd>DapStop<cr>",             desc = "Stop" },
            { "<leader>dt", "<cmd>DapUiToggle<cr>",         desc = "UI Toggle" },
            { "<leader>du", "<cmd>DapStepOut<cr>",          desc = "Step Out" },
        },

        -- Search
        {
            { "<leader>f",  group = "Search" },
            { "<leader>fC", "<cmd>Telescope commands<cr>",                                            desc = "Commands" },
            { "<leader>fM", "<cmd>Telescope man_pages<cr>",                                           desc = "Man Pages" },
            { "<leader>fR", "<cmd>Telescope registers<cr>",                                           desc = "Registers" },
            { "<leader>fb", "<cmd>Telescope git_branches<cr>",                                        desc = "Checkout branch" },
            { "<leader>fc", "<cmd>Telescope colorscheme<cr>",                                         desc = "Colorscheme" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>",                                          desc = "Find Files" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",                                           desc = "Find Help" },
            { "<leader>fk", "<cmd>Telescope keymaps<cr>",                                             desc = "Keymaps" },
            { "<leader>fo", "<cmd>Telescope oldfiles<cr>",                                            desc = "Open Recent File" },
            { "<leader>fr", "<cmd>Telescope treesitter<cr>",                                          desc = "References" },
            { "<leader>fs", "<cmd>cd ~/.local/share/chezmoi | :Telescope find_files hidden=true<CR>", desc = "Settings" },
            { "<leader>ft", "<cmd>Telescope live_grep search_dirs=.<cr>",                             desc = "Find Text" },
            { "<leader>fw", "<cmd>Telescope vw<CR>",                                                  desc = "Find Wiki" },
        },

        -- Git
        {
            { "<leader>g",  group = "Git" },
            { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",    desc = "Reset Buffer" },
            { "<leader>gb", "<cmd>Telescope git_branches<cr>",                   desc = "Checkout branch" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>",                    desc = "Checkout commit" },
            { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                   desc = "Diff" },
            { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                    desc = "Lazygit" },
            { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",       desc = "Next Hunk" },
            { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       desc = "Prev Hunk" },
            { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",      desc = "Blame" },
            { "<leader>go", "<cmd>Telescope git_status<cr>",                     desc = "Open changed file" },
            { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",    desc = "Preview Hunk" },
            { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",      desc = "Reset Hunk" },
            { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",      desc = "Stage Hunk" },
            { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
        },

        -- LSP
        {
            { "<leader>l",  group = "LSP" },
            { "<leader>lI", "<cmd>LspInstallInfo<cr>",                            desc = "Installer Info" },
            { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",   desc = "Workspace Symbols" },
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",             desc = "Code Action" },
            { "<leader>lc", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", desc = "Toggle Completions" },
            { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>",             desc = "Document Diagnostics" },
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>",        desc = "Format" },
            { "<leader>li", "<cmd>LspInfo<cr>",                                   desc = "Info" },
            { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",            desc = "Next Diagnostic" },
            { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",            desc = "Prev Diagnostic" },
            { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                desc = "CodeLens Action" },
            { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",           desc = "Quickfix" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                  desc = "Rename" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>",            desc = "Document Symbols" },
            { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                     desc = "Workspace Diagnostics" },
        },

        -- Packages
        {
            { "<leader>p",  group = "Package Management" },
            { "<leader>pc", "<cmd>Lazy<cr>",             desc = "Check" },
            { "<leader>ps", "<cmd>Lazy sync<cr>",        desc = "Sync" },
            { "<leader>pu", "<cmd>Lazy update<cr>",      desc = "Update" },
        },

        -- Terminal
        {
            { "<leader>t",  group = "Terminal" },
            { "<leader>td", "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>",                desc = "Lazydocker" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",              desc = "Float" },
            { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
            { "<leader>tl", "<cmd>lua _TASK_TOGGLE()<cr>",                      desc = "Task List" },
            { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>",                      desc = "Node" },
            { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>",                    desc = "Python" },
            { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                      desc = "Htop" },
            { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                      desc = "NCDU" },
            { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   desc = "Vertical" },
            { "<leader>tw", "<cmd>silent !nw '%:p:h'<cr>",                      desc = "New Window" },
        },
    },
    mode = { "v" },
    nowait = true,
    remap = false,
    silent = true,
    -- AI
    {
        { "<leader>a",  group = "AI" },
        { "<leader>aa", "<cmd>CodeCompanionActions<CR>",     desc = "Actions" },
        { "<leader>ae", "<cmd>CodeCompanion /explain<CR>",   desc = "Explain" },
        { "<leader>af", "<cmd>CodeCompanion /fix<CR>",       desc = "Fix" },
        { "<leader>ai", "<cmd>CodeCompanionChat Add<CR>",    desc = "Insert to Chat" },
        { "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
        { "<leader>au", "<cmd>CodeCompanion /tests<CR>",     desc = "Unit Test" },
    },

    -- Comment
    {
        { "<leader>c",  group = "Comment" },
        { "<leader>cb", "<ESC><CMD>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", desc = "Comment Block" },
        { "<leader>cc", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",  desc = "Comment Line" },
    },
})
