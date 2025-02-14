return {
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        "windwp/nvim-autopairs",
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua", },
    },
    {
        "neanias/everforest-nvim",
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",                    -- enable LSP
        dependencies = { "williamboman/mason.nvim", -- simple to use language server installer
            "williamboman/mason-lspconfig.nvim",    -- simple to use language server installer
            'jose-elias-alvarez/null-ls.nvim', }    -- LSP diagnostics and code actions
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    },
    {
        "ahmedkhalf/project.nvim",
    },
    {
        'simrat39/symbols-outline.nvim'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "akinsho/toggleterm.nvim",
    },
    {
        "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
        "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        dependencies = {
            'echasnovski/mini.icons'
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    }
}
