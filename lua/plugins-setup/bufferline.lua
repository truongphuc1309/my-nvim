vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        close_command =  function(n)
            require("mini.bufremove").delete(n, false)
            require("bufferline.ui").refresh()
        end,

        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
    }
})
