if vim.g.vscode then
    -- vim.cmd [[set runtimepath^=~/.config/nvim/lazy.nvim]]
    require("vscode")
else
    require("core")
end

-- local status_ok_lazy, lazy = pcall(require, "lazy")
-- if not status_ok_lazy then
--     lazy = require("core.lazy")
-- end
--
-- lazy.setup({
--     {
--         import = 'plugins',
--         cond = (function()
--             return not vim.g.vscode
--         end)
--     },
--     {
--         import = 'vscode.plugins',
--         cond = (function()
--             return vim.g.vscode
--         end
--         )
--     }
-- })
