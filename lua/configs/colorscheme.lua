vim.g.everforest_diagnostic_line_highlight = 1

local status_ok, everforest = pcall(require, "everforest")
if not status_ok then
    return
end

local function highlights(hl, palette)
    -- hl.DiagnosticSignError = { fg = palette.red, bg = palette.none, sp = palette.red }
    -- hl.DiagnosticSignWarn = { fg = palette.yellow, bg = palette.none, sp = palette.yellow }
    -- hl.DiagnosticSignInfo = { fg = palette.blue, bg = palette.none, sp = palette.blue }
    hl.DiagnosticSignHint = { fg = palette.orange, bg = palette.none, sp = palette.none }
    hl.DiagnosticVirtualTextHint = { fg = palette.orange, bg = palette.none, sp = palette.none }
end

everforest.setup({
    on_highlights = highlights,
})

vim.cmd("colorscheme everforest")

local diagnostic_config = {
signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorLine",
      [vim.diagnostic.severity.WARN]  = "WarningLine",
      [vim.diagnostic.severity.INFO]  = "InfoLine",
      [vim.diagnostic.severity.HINT]  = "HintLine",
    },
  },
  virtual_text = true,
  underline = true,
  update_in_insert = false,
}

vim.diagnostic.config(diagnostic_config)

-- local signs = {
--     { name = "DiagnosticSignError", text = "", line = "ErrorLine" },
--     { name = "DiagnosticSignWarn", text = "", line = "WarningLine" },
--     { name = "DiagnosticSignInfo", text = "", line = "InfoLine" },
--     { name = "DiagnosticSignHint", text = "", line = "HintLine" },
-- }
--
-- for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, linehl = sign.line })
-- end
