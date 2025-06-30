local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end
indent_blankline.setup({
    -- see :h ibl.config
    enabled = true,
    indent = {
        char = "▏",
    },
    exclude = {
        filetypes = {
            "Fterm",
            "toggleterm",
            "alfa",
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
        },
    },
})
