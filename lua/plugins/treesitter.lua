return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "rust",
            "lua",
            "cpp",
            "c",
            "python",
        },

        sync_install = false,

        auto_install = true,

        ignore_install = {},

        highlight = {
            enable = true,

            disable = {},

            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup(opts)
    end,
}
