local status_ok_lspsage, lspsaga = pcall(require, "lspsaga")
if not status_ok_lspsage then
    return
end
lspsaga.setup({})

require "configs.lsp.mason"
require("configs.lsp.handlers").setup()
require "configs.lsp.null-ls"
