local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

-- https://patorjk.com/software/taag/#p=display&f=Big&t=Nvim
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    -- 	[[                               __                ]],
    -- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    -- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    -- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    -- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    -- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    -- }
    [[                                               ]],
    [[                                               ]],
    [[                                               ]],
    [[            _   _       _                      ]],
    [[           | \ | |     (_)                     ]],
    [[           |  \| |_   ___ _ __ ___             ]],
    [[           | . ` \ \ / / | '_ ` _ \            ]],
    [[           | |\  |\ V /| | | | | | |           ]],
    [[           |_| \_| \_/ |_|_| |_| |_|           ]],
    [[                                               ]],
    [[                                               ]],
    [[                                               ]],
    [[                                               ]],
}

local personal_wiki
local work_wiki

if (vim.g.computer == "Personal") then
    personal_wiki = ":VimwikiIndex 1<CR>"
    work_wiki = ":VimwikiIndex 2<CR>"
else
    personal_wiki = ":VimwikiIndex 2<CR>"
    work_wiki = ":VimwikiIndex 1<CR>"
end

-- Home or Work
dashboard.section.buttons.val = {
    dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("e", "󰙅  File Explorer", ":NvimTreeOpen <CR>"),
    dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("s", "  Settings", ":cd ~/.local/share/chezmoi | :Telescope find_files hidden=false<CR>"),
    dashboard.button("ns", "  Nix Settings", ":cd ~/.config/nix-config | :Telescope find_files hidden=false<CR>"),
    dashboard.button("wp", "  Personal Wiki", personal_wiki),
    dashboard.button("ww", "  Work Wiki", work_wiki),
    dashboard.button("d", "  Diary Entry", ":VimwikiMakeDiaryNote<CR>"),
    dashboard.button("q", "󰅚  Quit Neovim", ":qa<CR>"),
}

-- dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
