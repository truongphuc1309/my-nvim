vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		close_command = function(n)
			require("mini.bufremove").delete(n, false)
			require("bufferline.ui").refresh()
		end,

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
		diagnostics = "nvim_lsp",
		separator_style = "thin",
	},
})
