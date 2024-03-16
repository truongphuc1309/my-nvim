-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = false,
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            window_picker = {
            enable = false,
            },
        },
    },
})
