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

local signs = {
    { name = "DiagnosticSignError", text = "", line = "ErrorLine" },
    { name = "DiagnosticSignWarn", text = "", line = "WarningLine" },
    { name = "DiagnosticSignInfo", text = "", line = "InfoLine" },
    { name = "DiagnosticSignHint", text = "", line = "HintLine" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, linehl = sign.line })
end
