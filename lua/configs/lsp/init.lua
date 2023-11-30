local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
    return
end
lspsaga.setup({})


require "configs.lsp.mason"
require("configs.lsp.handlers").setup()
require "configs.lsp.null-ls"
