-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local options = { silent = true }

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")

-- Save file
keymap.set("n", "<leader>ss", ":w<CR>")

-- Tab
keymap.set("n", "<Tab>", ":><CR>", options)
keymap.set("v", "<Tab>", ":><CR>", options)
keymap.set("n", "<S-Tab>", ":<<CR>", options)
keymap.set("v", "<S-Tab>", ":<<CR>", options)

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", options)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", options)

-- delete single character without copying into register
keymap.set({ "n", "v" }, "x", '"_x')
keymap.set("n", "X", 'V"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", options) -- open new tab
keymap.set("n", "<leader>tx", function(n)
	require("mini.bufremove").delete(n, false)
	require("bufferline.ui").refresh()
end) -- close current tab
keymap.set("n", "<S-l>", ":bnext<CR>", options) --  go to next tab
keymap.set("n", "<S-h>", ":bprevious<CR>", options) --  go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", options) -- toggle file explorer

-- Floaterm
vim.cmd([[
nnoremap <silent> <leader>ft :FloatermToggle<CR>
tnoremap <silent> <leader>ft <C-\><C-n>:FloatermToggle<CR>
]])
