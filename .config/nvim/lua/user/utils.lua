vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal nocursorline
   " trigger `autoread` when files changes on disk
    set autoread
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " notification after file change
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]]

-- Apply changes via Chezmoi
local saveGroup = vim.api.nvim_create_augroup("Settings", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.g.homedirvar .. "/.local/share/chezmoi/*",
    command = "silent! !chezmoi apply --source-path '%'",
    group = saveGroup
})

-- Autoformat File
local formatGroup = vim.api.nvim_create_augroup("Format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format()
    end,
    group = formatGroup
})

-- Make folds look better
function _G.CustomFoldText()
    return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldtext = 'v:lua.CustomFoldText()'
vim.opt.fillchars:append({ fold = ' ' })

-- Packer Snapshots
local last_snapshot = vim.g.homedirvar .. "/.local/share/chezmoi/private_dot_config/nvim/plugin/snapshot"

vim.api.nvim_create_user_command(
    'PluginUpdate',
    function()
        local packer = require('packer')
        local name = vim.fn.strftime('%Y-%m-%d@%H:%M:%S')

        packer.snapshot(name)
        vim.fn.writefile({ name }, last_snapshot .. "/" .. name)

        local timer = vim.loop.new_timer()
        local wait_ms = 1000

        timer:start(wait_ms, 0, function()
            timer:stop()
            timer:close()
            packer.sync()
        end)
    end,
    {}
)

vim.api.nvim_create_user_command(
    'PluginRestore',
    function()
        local ok, name = pcall(vim.fn.readfile, last_snapshot, 1)
        if not ok then return end

        require('packer').rollback(name[1])
    end,
    {}
)

vim.api.nvim_create_user_command(
    'VimWikiDiaryToday',
    function()
        vim.cmd "VimwikiDiaryIndex"
        vim.cmd "VimwikiDiaryGenerateLinks"
        vim.cmd "write"
        vim.cmd "VimwikiMakeDiaryNote"
    end,
    {}
)

-- Source all Lua files in plugin
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = vim.g.homedirvar .. "/.local/share/chezmoi/private_dot_config/nvim/*",
--     command = "runtime! plugin.d/*.lua",
--     group = saveGroup
-- })

-- Auto Git for Wiki
-- local vimwikiGroup = vim.api.nvim_create_augroup("vimwiki", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = vim.g.homedirvar .. "/remitlywiki/*",
--     command = "silent! !cd ~/RemitlyWiki; git add .;git commit -m 'vim autocommit'; git push",
--     group = vimwikiGroup
-- })
-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = vim.g.homedirvar .. "/remitlywiki/*",
--     command = "silent! !cd ~/RemitlyWiki; git pull > /dev/null",
--     group = vimwikiGroup
-- })

-- Remove numbers in Terminal
-- local TerminalGroup = vim.api.nvim_create_augroup("Terminal", { clear = true })
-- vim.api.nvim_create_autocmd("TermOpen", { command = "setlocal nonumber norelativenumber", group = TerminalGroup })

--we can load shada now
vim.opt.shadafile = ""
