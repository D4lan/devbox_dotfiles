local colorscheme = "catppuccin-mocha"

local status_ok_color, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_color then
    return
end

local status_ok_theme, theme = pcall(require, themeplugin)
if not status_ok_theme then
    return
end

theme.setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {    -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- -- Github
-- -- theme.setup({
-- -- theme_style = "dark_default",
-- -- transparent = "true",
-- -- comment_style = "italic"
-- -- })
--
-- -- Dracula
-- theme.setup({
--     -- customize dracula color palette
--     colors = {
--         bg = "#282A36",
--         fg = "#F8F8F2",
--         selection = "#44475A",
--         --comment = "#6272A4",
--         comment = "#6887e3",
--         red = "#FF5555",
--         orange = "#FFB86C",
--         yellow = "#F1FA8C",
--         green = "#50fa7b",
--         purple = "#BD93F9",
--         cyan = "#8BE9FD",
--         pink = "#FF79C6",
--         bright_red = "#FF6E6E",
--         bright_green = "#69FF94",
--         bright_yellow = "#FFFFA5",
--         bright_blue = "#D6ACFF",
--         bright_magenta = "#FF92DF",
--         bright_cyan = "#A4FFFF",
--         bright_white = "#FFFFFF",
--         menu = "#21222C",
--         visual = "#3E4452",
--         gutter_fg = "#4B5263",
--         nontext = "#3B4048",
--     },
--     -- show the '~' characters after the end of buffers
--     show_end_of_buffer = false, -- default false
--     -- use transparent background
--     transparent_bg = true,      -- default false
--     -- set custom lualine background color
--     lualine_bg_color = nil,     -- default nil
--     -- set italic comment
--     italic_comment = true,      -- default false
--     -- overrides the default highlights see `:h synIDattr`
--     overrides = {
--         -- Examples
--         -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
--         -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
--         -- Nothing = {} -- clear highlight of Nothing
--         -- comment = { fg = theme.colors().men }
--     },
-- })
--
-- -- vim.cmd [[colorscheme github_dark_default]]
-- vim.cmd [[colorscheme Dracula]]
--
-- -- Lualine Custom Theme Colors
-- local M = {}
-- M.theme = function()
--     local colors = {
--         darkgray = "#16161d",
--         gray = "#FFFFFF",
--         innerbg = nil, -- Transpartent Backgroud
--         outerbg = "#16161D",
--         normal = "#7e9cd8",
--         insert = "#8AFF8A",
--         visual = "#ffa066",
--         replace = "#e46876",
--         command = "#e6c384",
--     }
--     return {
--         inactive = {
--             a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--         visual = {
--             a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--         replace = {
--             a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--         normal = {
--             a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--         insert = {
--             a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--         command = {
--             a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
--             b = { fg = colors.gray, bg = colors.outerbg },
--             c = { fg = colors.gray, bg = colors.innerbg },
--         },
--     }
-- end
-- return M
