return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvim-mini/mini.icons'
        },
        opts = {
            preset = "helix",
            icons = {
                separator = "│",
            },
        },
        keys = {
        },
        config = function(_, opts)
            local which_key = require("which-key")
            which_key.setup(opts)

            local normal_config = {
                { "<leader>w", "<cmd>w!<CR>", desc = "Save", icon = { icon = "󰆏", color = "cyan" }, mode = "n" },
                { "<leader>q", "<cmd>q!<CR>", desc = "Quit", mode = "n" },
                { "<leader>c", "<cmd>bd<CR>", desc = "Close buffer", mode = "n" },
                { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Highlight", icon = { icon = "󰌶", color = "yellow" }, mode = "n" },
                { "<leader>e", "<cmd>Neotree reveal toggle<cr>", desc = "Explorer", icon = { icon = "󰙅", color = "blue" }, mode = "n" },
            }

            which_key.add(normal_config)
        end
    }
}
