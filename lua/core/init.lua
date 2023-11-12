local leader_map = function()
    vim.g.mapleader = " "
    vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
    vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local function enable_loader()
    vim.loader.enable()
end

local function load_core()
    enable_loader()
    leader_map()
    require("core.options")
    require("core.keymaps")
    require("core.lazy")
    require("configs")
end

load_core()
