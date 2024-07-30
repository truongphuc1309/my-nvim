local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

-- auto reload whenever udapte file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- greeter
    use("goolord/alpha-nvim")
    -- Dracula Theme
    use("Mofiqul/dracula.nvim")
    -- use("folke/tokyonight.nvim")

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    -- maximizes and restores current window
    use("szw/vim-maximizer")

    -- essential plugins
    use("tpope/vim-surround")            -- add, delete, change surroundings (it's awesome)
    use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- vs-code like icons
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    -- bufferline
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

    -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- snippets
    use("L3MON4D3/LuaSnip")          -- snippet engine
    use("saadparwaiz1/cmp_luasnip")  -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim")        -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })                       -- enhanced lsp uis
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- auto closing
    use("windwp/nvim-autopairs")                              -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags::

    -- Plugin for ts js
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

    -- Indent Line
    use("lukas-reineke/indent-blankline.nvim")

    -- Internal terminal
    use("voldikss/vim-floaterm")

    -- commenter
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- formatters
    use({ "stevearc/conform.nvim" })

    -- For close buffers
    use("echasnovski/mini.bufremove")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
