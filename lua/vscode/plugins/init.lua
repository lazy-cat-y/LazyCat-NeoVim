-- VS Code: some functionality is changed/disabled when running flash in VS Code:
--
-- prompt is disabled
-- highlights are set to different defaults that will actually work in VS Code
return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        vscode = true,
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote({
                        restore = true,
                        motion = true,
                    })
                end,
                desc = "Remote Flash"
            },
            -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    }
}
