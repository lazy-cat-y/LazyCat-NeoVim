local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local normal_config = {
    { "<leader>/", "<cmd>lua require(\"Comment.api\").toggle.linewise.current()<CR>",                                                desc = "Comment",      mode = "n" },
    { "<leader>a", "<cmd>Alpha<cr>",                                                                                                 desc = "Alpha",        mode = "n" },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers",      mode = "n" },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>",                                                                                        desc = "Explorer",     mode = "n" },
    { "<leader>w", "<cmd>w!<CR>",                                                                                                    desc = "Save",         mode = "n" },
    { "<leader>q", "<cmd>q!<CR>",                                                                                                    desc = "Quit",         mode = "n" },
    { "<leader>c", "<cmd>bd<CR>",                                                                                                    desc = "Close buffer", mode = "n" },
    { "<leader>h", "<cmd>nohlsearch<CR>",                                                                                            desc = "No Highlight", mode = "n" },
    { "<leader>O", "<cmd>Outline<CR>",                                                                                               desc = "Outline",      mode = "n" },
    -- {"<leader>H", "<cmd>TSBufToggle highlight<CR>", desc="treesitter highlight", mode="n"},
    { "<leader>f", "<cmd>Telescope find_files<cr>",                                                                                  desc = "Find files",   mode = "n" },
    { "<leader>F", "<cmd>Telescope live_grep<cr>",                                                                                   desc = "Find Text",    mode = "n" },
    { "<leader>P", "<cmd>Telescope projects<cr>",                                                                                    desc = "Projects",     mode = "n" },
    { "<leader>u", "<cmd>TSUpdate all<cr>",                                                                                          desc = "Treesitter",   mode = "n" }
}

local lsp_config = {
    { "<leader>l", group = "Lsp", icon = "" },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", mode = "n" },
    { "<leader>le", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Show diagnostics", mode = "n" },
    { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics", mode = "n" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Code Format", mode = "n" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", mode = "n" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", mode = "n" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix", mode = "n" },
    { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename", mode = "n" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", mode = "n" },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", mode = "n" },
    { "<leader>lh", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })<cr>", desc = "Toggle Inlay Hints", mode = "n" }
}

local packer_config = {
    { "<leader>p",  group = "Packer" },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", mode = "n" },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", mode = "n" },
    { "<leader>ps", "<cmd>PackerSync<cr>",    desc = "Sync",    mode = "n" },
    { "<leader>pS", "<cmd>PackerStatus<cr>",  desc = "Status",  mode = "n" },
    { "<leader>pu", "<cmd>PackerUpdate<cr>",  desc = "Update",  mode = "n" },
}

local git_config = {
    { "<leader>g",  group = "Git" },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>",                    desc = "Lazygit",           mode = "n" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",       desc = "Next Hunk",         mode = "n" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       desc = "Prev Hunk",         mode = "n" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",      desc = "Blame",             mode = "n" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",    desc = "Preview Hunk",      mode = "n" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",      desc = "Reset Hunk",        mode = "n" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",    desc = "Reset Buffer",      mode = "n" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",      desc = "Stage Hunk",        mode = "n" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk",   mode = "n" },
    { "<leader>go", "<cmd>Telescope git_status<cr>",                     desc = "Open changed file", mode = "n" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>",                   desc = "Checkout branch",   mode = "n" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>",                    desc = "Checkout commit",   mode = "n" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                   desc = "Diff",              mode = "n" },
}

local search_config = {
    { "<leader>s",  group = "Search" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch",  mode = "n" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>",  desc = "Colorscheme",      mode = "n" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",    desc = "Find Help",        mode = "n" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",    desc = "Man Pages",        mode = "n" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>",     desc = "Open Recent File", mode = "n" },
    { "<leader>sR", "<cmd>Telescope registers<cr>",    desc = "Open Recent File", mode = "n" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",      desc = "Keymaps",          mode = "n" },
    { "<leader>sC", "<cmd>Telescope commands<cr>",     desc = "Commands",         mode = "n" },
}

local terminal_config = {
    { "<leader>t",  group = "Terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",              desc = "Float",      mode = "n" },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", mode = "n" },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   desc = "Vertical",   mode = "n" },
}


which_key.add(normal_config)
which_key.add(lsp_config)
which_key.add(packer_config)
which_key.add(git_config)
which_key.add(search_config)
which_key.add(terminal_config)
