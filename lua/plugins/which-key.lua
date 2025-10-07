return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-mini/mini.icons",
        },
        opts = {
            preset = "helix",
            win = {
                wo = {
                    winblend = 0,
                },
            },
            icons = {
                separator = "│",
            },
        },
        keys = {},
        config = function(_, opts)
            local which_key = require("which-key")
            which_key.setup(opts)

            local normal_config = {
                { "<leader>w", "<cmd>w!<CR>", desc = "Save", icon = { icon = "󰆏", color = "cyan" }, mode = "n" },
                { "<leader>q", "<cmd>q!<CR>", desc = "Quit", mode = "n" },
                { "<leader>c", "<cmd>bd<CR>", desc = "Close buffer", mode = "n" },
                {
                    "<leader>h",
                    "<cmd>nohlsearch<cr>",
                    desc = "Highlight",
                    icon = { icon = "󰌶", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>e",
                    "<cmd>Neotree reveal toggle<cr>",
                    desc = "Explorer",
                    icon = { icon = "󰙅", color = "blue" },
                    mode = "n",
                },
            }

            local find_config = {
                { "<leader>f", group = "search" },
                {
                    "<leader>ff",
                    "<cmd>FzfLua files<cr>",
                    desc = "Find files",
                    icon = { icon = "󰍉", color = "cyan" },
                    mode = "n",
                },
                {
                    "<leader>fl",
                    "<cmd>FzfLua live_grep_native<cr>",
                    desc = "Live grep",
                    icon = { icon = "󰈭", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>fb",
                    "<cmd>FzfLua buffers<cr>",
                    desc = "Buffers",
                    icon = { icon = "󰓩", color = "orange" },
                    mode = "n",
                },
                {
                    "<leader>ft",
                    "<cmd>FzfLua treesitter<cr>",
                    desc = "Treesitter",
                    icon = { icon = "󰙅", color = "green" },
                    mode = "n",
                },
                {
                    "<leader>fo",
                    "<cmd>FzfLua oldfiles<cr>",
                    desc = "Files history",
                    icon = { icon = "󰋚", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>fq",
                    "<cmd>FzfLua grep_quickfix<cr>",
                    desc = "Quickfix list",
                    icon = { icon = "󰁨", color = "red" },
                    mode = "n",
                },
            }

            local git_config = {
                { "<leader>g", group = "Git" },
                {
                    "<leader>gf",
                    "<cmd>FzfLua git_files<cr>",
                    desc = "Files",
                    icon = { icon = "󰈢", color = "red" },
                    mode = "n",
                },
                {
                    "<leader>gg",
                    "<cmd>LazyGit<cr>",
                    desc = "LazyGit",
                    icon = { icon = "󰊢", color = "red" },
                    mode = "n",
                },
                {
                    "<leader>gh",
                    "<cmd>FzfLua git_hunks<cr>",
                    desc = "Hunks",
                    icon = { icon = "󰦓", color = "orange" },
                    mode = "n",
                },
                {
                    "<leader>gc",
                    "<cmd>FzfLua git_commits<cr>",
                    desc = "Commits",
                    icon = { icon = "󰜘", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>gs",
                    "<cmd>FzfLua git_status<cr>",
                    desc = "Status",
                    icon = { icon = "󰊢", color = "red" },
                    mode = "n",
                },
                {
                    "<leader>gd",
                    "<cmd>FzfLua git_diff<cr>",
                    desc = "Diff",
                    icon = { icon = "󰦓", color = "orange" },
                    mode = "n",
                },
                {
                    "<leader>gb",
                    "<cmd>FzfLua git_blame<cr>",
                    desc = "Blame",
                    icon = { icon = "󰍩", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>gt",
                    "<cmd>FzfLua git_tags<cr>",
                    desc = "Tags",
                    icon = { icon = "󰓹", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>gx",
                    "<cmd>FzfLua git_stash<cr>",
                    desc = "Stash",
                    icon = { icon = "󰆼", color = "blue" },
                    mode = "n",
                },
            }

            local lsp_config = {
                {
                    "]d",
                    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>',
                    desc = "Next diagnostic",
                    icon = { icon = "󰅂", color = "orange" },
                    mode = "n",
                },
                {
                    "[d",
                    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>',
                    desc = "Prev diagnostic",
                    icon = { icon = "󰅁", color = "orange" },
                    mode = "n",
                },

                { "<leader>l", group = "Lsp", icon = { icon = "", color = "green" } },
                {
                    "<leader>ld",
                    "<cmd>FzfLua lsp_definitions<cr>",
                    desc = "Definitions",
                    icon = { icon = "󰈔", color = "blue" },
                    mode = "n",
                },
                {
                    "<leader>lD",
                    "<cmd>FzfLua lsp_declarations<cr>",
                    desc = "Declarations",
                    icon = { icon = "󰷊", color = "blue" },
                    mode = "n",
                },
                {
                    "<leader>lr",
                    "<cmd>FzfLua lsp_references<cr>",
                    desc = "References",
                    icon = { icon = "󰌹", color = "cyan" },
                    mode = "n",
                },
                {
                    "<leader>lt",
                    "<cmd>FzfLua lsp_typedefs<cr>",
                    desc = "Typedefs",
                    icon = { icon = "󰙅", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>li",
                    "<cmd>FzfLua lsp_implementations<cr>",
                    desc = "Implementations",
                    icon = { icon = "󰌵", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>lI",
                    "<cmd>FzfLua lsp_incoming_calls<cr>",
                    desc = "Incoming calls",
                    icon = { icon = "󰇙", color = "cyan" },
                    mode = "n",
                },
                {
                    "<leader>lO",
                    "<cmd>FzfLua lsp_outgoing_calls<cr>",
                    desc = "Outgoing calls",
                    icon = { icon = "󰇚", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>la",
                    "<cmd>FzfLua lsp_code_actions<cr>",
                    desc = "Code Actions",
                    icon = { icon = "󰌵", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>lF",
                    "<cmd>FzfLua lsp_finder<cr>",
                    desc = "Finder",
                    icon = { icon = "󰍉", color = "cyan" },
                    mode = "n",
                },
                {
                    "<leader>lf",
                    "<cmd>lua vim.lsp.buf.format()<cr>",
                    desc = "Format",
                    icon = { icon = "󰉵", color = "blue" },
                    mode = "n",
                },
                {
                    "<leader>lh",
                    "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })<cr>",
                    desc = "Inlay Hints",
                    icon = { icon = "󰋼", color = "purple" },
                    mode = "n",
                },

                { "<leader>ls", group = "Symbols", icon = { icon = "", color = "green" } },
                {
                    "<leader>lsd",
                    "<cmd>FzfLua lsp_document_symbols<cr>",
                    desc = "Document",
                    icon = { icon = "󰊕", color = "cyan" },
                    mode = "n",
                },
                {
                    "<leader>lsw",
                    "<cmd>FzfLua lsp_workspace_symbols<cr>",
                    desc = "Workspace",
                    icon = { icon = "󰙅", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>lsl",
                    "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
                    desc = "Live workspace",
                    icon = { icon = "󰔶", color = "yellow" },
                    mode = "n",
                },

                { "<leader>lb", group = "Diagnostics", icon = { icon = "", color = "green" } },
                {
                    "<leader>lbd",
                    "<cmd>FzfLua diagnostics_document<cr>",
                    desc = "Document",
                    icon = { icon = "󰋼", color = "green" },
                    mode = "n",
                },
                {
                    "<leader>lbw",
                    "<cmd>FzfLua diagnostics_workspace<cr>",
                    desc = "Workspace",
                    icon = { icon = "󰈔", color = "purple" },
                    mode = "n",
                },
                {
                    "<leader>lbD",
                    "<cmd>FzfLua lsp_document_diagnostics<cr>",
                    desc = "Lsp workspace",
                    icon = { icon = "󰌵", color = "yellow" },
                    mode = "n",
                },
                {
                    "<leader>lbW",
                    "<cmd>FzfLua lsp_workspace_diagnostics<cr>",
                    desc = "Lsp workspace",
                    icon = { icon = "󰌵", color = "yellow" },
                    mode = "n",
                },
            }

            which_key.add(normal_config)
            which_key.add(find_config)
            which_key.add(git_config)
            which_key.add(lsp_config)
        end,
    },
}
