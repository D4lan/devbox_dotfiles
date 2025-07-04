local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- 󰃐 󰆩 󰙅 󰛡  󰅲 some other good icons
local kind_icons = {
    Text = "󰉿",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰆧",
    Class = "󰌗",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰇽",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
    -- Allow toggling cmp
    enabled =
        function()
            return vim.g.cmptoggle
        end
    ,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        -- ["<UP>"] = cmp.mapping.select_prev_item(),
        -- ["<DOWN>"] = cmp.mapping.select_next_item(),
        ["<c-k>"] = cmp.mapping.select_prev_item(),
        ["<c-j>"] = cmp.mapping.select_next_item(),
        ["<PageUp>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<PageDown>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        --["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
        --     ["<Tab>"] = cmp.mapping(function(fallback)
        --       if cmp.visible() then
        --         cmp.select_next_item()
        --       elseif luasnip.expandable() then
        --         luasnip.expand()
        --       elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --       elseif check_backspace() then
        --         fallback()
        --       else
        --         fallback()
        --       end
        --     end, {
        --       "i",
        --       "s",
        --     }),
        --     ["<S-Tab>"] = cmp.mapping(function(fallback)
        --       if cmp.visible() then
        --         cmp.select_prev_item()
        --       elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --       else
        --         fallback()
        --       end
        --     end, {
        --       "i",
        --       "s",
        --     }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                codecompanion = "[AI]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "codecompanion" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}

-- initialize global var to true -> nvim-cmp turned on per default
vim.g.cmptoggle = true
