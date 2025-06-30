vim.loader.enable()

local options = {
    -- General

    clipboard      = "unnamedplus", -- allows neovim to access the system clipboard
    history        = 1000,
    backspace      = "indent,eol,start",
    startofline    = true,
    spelllang      = 'en_us',
    spell          = false,
    cmdheight      = 1,                         -- more space in the neovim command line for displaying messages
    lazyredraw     = true,                      -- Don't redraw the screen when doing big tasks
    shadafile      = "NONE",                    -- Don't write to the ShaDa file on startup
    completeopt    = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel   = 0,                         -- so that `` is visible in markdown files
    fileencoding   = "utf-8",                   -- the encoding written to a file
    hlsearch       = true,                      -- highlight all matches on previous search pattern
    ignorecase     = true,                      -- ignore case in search patterns
    mouse          = "",                        -- allow the mouse to be used in neovim
    pumheight      = 10,                        -- pop up menu height
    showmode       = false,                     -- we don't need to see things like -- INSERT -- anymore
    showtabline    = 2,                         -- always show tabs
    smartcase      = true,                      -- smart case
    smartindent    = true,                      -- make indenting smarter again
    termguicolors  = true,                      -- set term gui colors (most terminals support this)
    updatetime     = 300,                       -- faster completion (4000ms default)
    cursorline     = true,                      -- highlight the current line
    linebreak      = true,                      -- companion to wrap, don't split words
    scrolloff      = 1,                         -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff  = 8,                         -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont        = "monospace:h17",           -- the font used in graphical neovim applications

    -- Mapping waiting time
    timeout        = true,
    timeoutlen     = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    -- ttimeout       = false, -- broke system when used. Pasted and did other things
    shell          = "/bin/zsh -i",

    -- ttimeoutlen = 600,

    -- Display
    showmatch      = true, -- show matching brackets
    foldlevel      = 1,    -- show matching brackets
    synmaxcol      = 300,  -- stop syntax highlight after x lines for performance
    splitright     = true, -- force all horizontal splits to go below current window
    splitbelow     = true, -- force all vertical splits to go to the right of current window

    tabstop        = 4,
    shiftwidth     = 4,
    softtabstop    = 4,
    expandtab      = true,
    list           = false, -- do not display white characters
    wrap           = true,  -- display lines as one long line
    eol            = false, -- show if there's no eol char
    --  showbreak = '↪ '    -- character to show when line is broken

    -- Sidebar
    number         = true,                                             -- set numbered lines
    relativenumber = true,                                             -- set relative numbered lines
    numberwidth    = 3,                                                -- set number column width to 2 {default 4}
    signcolumn     = 'yes',                                            -- keep 1 column for coc.vim  check
    modelines      = 0,
    showcmd        = false,                                            -- display command in bottom bar
    -- Backup files
    backup         = true,                                             -- use backup files
    writebackup    = false,
    swapfile       = true,                                             -- use swap file
    undofile       = true,                                             -- use undo file
    undodir        = vim.g.homedirvar .. '/.config/nvim/tmp/undo//',   -- undo files,
    backupdir      = vim.g.homedirvar .. '/.config/nvim/tmp/backup//', -- backups,
    directory      = vim.g.homedirvar .. '/.config/nvim/tmp/swap//',   -- swap files,
    -- Commands mode
    wildmenu       = true,                                             -- on TAB, complete options for system command
    wildignore     =
    'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
