-- Shorten function name
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap leader key
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("i", "<C-h>", "<C-w>h", opts)
keymap("i", "<C-j>", "<C-w>j", opts)
keymap("i", "<C-k>", "<C-w>k", opts)
keymap("i", "<C-l>", "<C-w>l", opts)
keymap("v", "<C-h>", "<C-w>h", opts)
keymap("v", "<C-j>", "<C-w>j", opts)
keymap("v", "<C-k>", "<C-w>k", opts)
keymap("v", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<PageDown>", ":bnext<CR>", opts)
keymap("n", "<PageUp>", ":bprevious<CR>", opts)

-- Apple movement
keymap('i', '<A-BS>', '<C-w>', { silent = true })
keymap('i', '<A-Right>', '<S-Right>', { silent = true })
keymap('i', '<A-Left>', '<S-Left>', { silent = true })

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- luasnip
keymap("i", "<S-Tab>", function() require("luasnip").jump(1) end, { silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Original File
-- General
keymap('v', '.', ':norm.<CR>', { silent = true }) -- Allow repeated commands in Visual mode
-- keymap('n', '<Tab>', '%', { silent = true })      -- Tab to go to brackets normal (this causes issues with <C-I> as they are the same Char)
-- keymap('v', '<Tab>', '%', { silent = true })      -- Tab to go to brackets visual (this causes issues with <C-I> as they are the same Char)

-- Abbreviations
vim.cmd 'abbrev idate <c-r>=strftime("%a, %b %d %Y")<cr>'
vim.cmd 'abbrev idtime <c-r>=strftime("%I:%M %p")<cr>'

-- Spelling
keymap('n', '<c-s>', '[sz=', { silent = true })
-- keymap('n', '<leader>s', ':set spell!<CR>', { silent = true })

-- VimWiki
vim.cmd 'abbrev wdate ## <c-r>=strftime("%a, %b %d %Y")<cr><cr><tab>-'
-- add new time in diary
keymap('n', '<leader>w<leader>t',
    ':VimwikiMakeDiaryNote<CR>zM:$<CR>o<ESC>0C#<Space><c-r>=strftime("%I:%M %p")<cr><cr><cr><up><tab>-<Space>',
    { silent = true })
-- add all things needed checks in to-do
keymap('n', "<leader>w<leader>d",
    ":let@a=''<CR>:g/-<Space>\\[<Space>\\]/yank<Space>A<CR>:%s/<Space>\\[<Space>\\]//g<CR>:e<Space>/Volumes/GoogleDrive/My Drive/Notes/Wiki/List.md<CR>Gp:noh<CR>"
    , { silent = true })
-- add check marks at the end of the day
-- keymap('n', "<leader>wc",
--     ":let@a=''<CR>:g/-<Space>\\[X\\]/d<Space>A<CR>:VimwikiMakeDiaryNote<CR>GA<CR>#<SPACE>Tasks<SPACE>Done:<ESC>p:noh<CR>"
--     , { silent = true })
keymap('n', "<leader>w<leader>c",
    ":let@a=''<CR>/## Completed<CR>jV/# GTD<CR>kd\"aO<ESC>:VimwikiMakeDiaryNote<CR>Go<esc>^C#<SPACE>Completed<SPACE>Tasks:<ESC>p:noh<CR>"
    , { silent = true })
keymap('n', "<leader>wgi",
    ":VimwikiIndex<CR>/# GTD<CR>:noh<CR>:VimwikiNextLink<CR>:VimwikiFollowLink<CR>"
    , { silent = true })
keymap('n', "<leader>wgn",
    ":VimwikiIndex<CR>/# GTD<CR>:noh<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiFollowLink<CR>"
    , { silent = true })
keymap('n', "<leader>wgw",
    ":VimwikiIndex<CR>/# GTD<CR>:noh<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiFollowLink<CR>"
    , { silent = true })
keymap('n', "<leader>wgp",
    ":VimwikiIndex<CR>/# GTD<CR>:noh<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiNextLink<CR>:VimwikiFollowLink<CR>"
    , { silent = true })
