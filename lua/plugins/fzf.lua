return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "FzfLuaTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { bg = "none" })

        -- customized color
        vim.api.nvim_set_hl(0, "FzfSelectedLine", { bg = "#3b4252" })

        local opts = {
            files = {
                cwd_prompt = false,
            },
            winopts = {
                height     = 0.85,
                width      = 0.80,
                row        = 0.35,
                col        = 0.50,
                border     = "rounded",
                backdrop   = 60,
                treesitter = {
                    enabled    = true,
                    fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
                },
                preview    = {
                    border       = "rounded",
                    wrap         = false,
                    hidden       = false,
                    vertical     = "down:45%",
                    horizontal   = "right:60%",
                    layout       = "flex",
                    flip_columns = 100,
                    title        = true,
                    title_pos    = "center",
                    scrollbar    = "float",
                    scrolloff    = -1,
                    delay        = 20,
                    winopts      = {
                        number         = true,
                        relativenumber = false,
                        cursorline     = true,
                        cursorlineopt  = "both",
                        cursorcolumn   = false,
                        signcolumn     = "no",
                        list           = false,
                        foldenable     = false,
                        foldmethod     = "manual",
                    },
                },
            },
            fzf_colors = {
                true,
                ["fg"]      = { "fg", "CursorLine" },
                ["bg"]      = { "bg", "Normal" },
                ["hl"]      = { "fg", "Comment" },
                ["fg+"]     = { "fg", "Normal", "underline" },
                ["bg+"]     = { "bg", "FzfSelectedLine" },
                ["hl+"]     = { "fg", "Statement" },
                ["info"]    = { "fg", "PreProc" },
                ["prompt"]  = { "fg", "Conditional" },
                ["pointer"] = { "fg", "Exception" },
                ["marker"]  = { "fg", "Keyword" },
                ["spinner"] = { "fg", "Label" },
                ["header"]  = { "fg", "Comment" },
                ["gutter"]  = "-1",
            },
        }

        fzf.setup(opts)
    end
}
