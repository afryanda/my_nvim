local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "folke/tokyonight.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",         -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip",         -- Snippets plugin
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }
    },
    "nvim-tree/nvim-tree.lua",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "jose-elias-alvarez/null-ls.nvim",
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("plugin/null_ls") -- require your null-ls config here (example below)
        end,
    },
    {
        'sindrets/diffview.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
})
