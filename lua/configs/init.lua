local function  set_nvim_tree()
        vim.g.nvim_tree_icons = {
            default = "",
            symlink = "",
            git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "U",
                ignored = "◌",
            },
            folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
            },
        }
end

local load_configs = function()

    set_nvim_tree()

    require("configs.colorscheme")
    require("configs.cmp-config")
    require("configs.lsp")
    require("configs.telescope")
    require("configs.autopairs")
    require("configs.terminal")
    require("configs.project")
    require("configs.bufferline")
    require("configs.lualine")
    require("configs.comment")
    require("configs.gitsigns")
    require("configs.nvim-treesitter")
    require("configs.toggleterm")

    require("configs.alpha")
    require("configs.whichkey")
    require("configs.symbols-outline")
end

load_configs()
