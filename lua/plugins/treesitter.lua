return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").install({
            "rust",
            "lua",
            "cpp",
            "c",
            "python",
        })
    end,
}
