local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end
--
-- local setup = {
--     plugins = {
--         marks = true,         -- shows a list of your marks on ' and `
--         registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--         spelling = {
--             enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--             suggestions = 20, -- how many suggestions should be shown in the list?
--         },
--         -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--         -- No actual key bindings are created
--         presets = {
--             operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
--             motions = false,      -- adds help for motions
--             text_objects = false, -- help for text objects triggered after entering an operator
--             windows = true,       -- default bindings on <c-w>
--             nav = true,           -- misc bindings to work with windows
--             z = true,             -- bindings for folds, spelling and others prefixed with z
--             g = true,             -- bindings for prefixed with g
--         },
--     },
--     -- add operators that will trigger motion and text object completion
--     -- to enable all native operators, set the preset / operators plugin above
--     -- operators = { gc = "Comments" },
--     key_labels = {
--         -- override the label used to display some keys. It doesn't effect WK in any other way.
--         -- For example:
--         -- ["<space>"] = "SPC",
--         -- ["<cr>"] = "RET",
--         -- ["<tab>"] = "TAB",
--     },
--     icons = {
--         breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--         separator = "➜", -- symbol used between a key and it's label
--         group = "+", -- symbol prepended to a group
--     },
--     popup_mappings = {
--         scroll_down = "<c-d>", -- binding to scroll down inside the popup
--         scroll_up = "<c-u>",   -- binding to scroll up inside the popup
--     },
--     window = {
--         border = "rounded",       -- none, single, double, shadow
--         position = "bottom",      -- bottom, top
--         margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
--         padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--         winblend = 0,
--     },
--     layout = {
--         height = { min = 4, max = 25 },                                           -- min and max height of the columns
--         width = { min = 20, max = 50 },                                           -- min and max width of the columns
--         spacing = 3,                                                              -- spacing between columns
--         align = "left",                                                           -- align columns left, center or right
--     },
--     ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
--     hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
--     show_help = true,                                                             -- show help message on the command line when the popup is visible
--     triggers = "auto",                                                            -- automatically setup triggers
--     -- triggers = {"<leader>"} -- or specify a list manually
--     triggers_blacklist = {
--         -- list of mode / prefixes that should never be hooked by WhichKey
--         -- this is mostly relevant for key maps that start with a native binding
--         -- most people should not need to change this
--         i = { "j", "k" },
--         v = { "j", "k" },
--     },
-- }
--
-- local opts = {
--     mode = "n",     -- NORMAL mode
--     prefix = "<leader>",
--     buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true,  -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true,  -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
--     ["/"] = { "<cmd>lua require(\"Comment.api\").toggle.linewise.current()<CR>", "Comment" },
--     ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
--     ["b"] = {
--         "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--         "Buffers",
--     },
--     ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
--     ["w"] = { "<cmd>w!<CR>", "Save" },
--     ["q"] = { "<cmd>q!<CR>", "Quit" },
--     ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
--     ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
--     ["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
--     ["H"] = { "<cmd>TSBufToggle highlight<CR>", "treesitter highlight" },
--     ["f"] = {
--         "<cmd>Telescope find_files<cr>",
--         "Find files",
--     },
--     ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
--     ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
--     ["u"] = { "<cmd>TSUpdate all<cr>", "Treesitter"},
--
--     p = {
--         name = "Packer",
--         c = { "<cmd>PackerCompile<cr>", "Compile" },
--         i = { "<cmd>PackerInstall<cr>", "Install" },
--         s = { "<cmd>PackerSync<cr>", "Sync" },
--         S = { "<cmd>PackerStatus<cr>", "Status" },
--         u = { "<cmd>PackerUpdate<cr>", "Update" },
--     },
--
--     g = {
--         name = "Git",
--         g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--         j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--         k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--         l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--         p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--         r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--         R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--         s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--         u = {
--             "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--             "Undo Stage Hunk",
--         },
--         o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--         d = {
--             "<cmd>Gitsigns diffthis HEAD<cr>",
--             "Diff",
--         },
--     },
--
--     l = {
--         name = "LSP",
--         -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--         a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
--         d = {
--             "<cmd>Telescope lsp_document_diagnostics<cr>",
--             "Document Diagnostics",
--         },
--         w = {
--             "<cmd>Telescope lsp_workspace_diagnostics<cr>",
--             "Workspace Diagnostics",
--         },
--         f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
--         i = { "<cmd>LspInfo<cr>", "Info" },
--         I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--         j = {
--             "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
--             "Next Diagnostic",
--         },
--         k = {
--             "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
--             "Prev Diagnostic",
--         },
--         l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--         q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--         -- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--         r = { "<cmd>Lspsaga rename<cr>", "Rename" },
--         s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--         S = {
--             "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--             "Workspace Symbols",
--         },
--     },
--     s = {
--         name = "Search",
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--         h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--         M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--         R = { "<cmd>Telescope registers<cr>", "Registers" },
--         k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--         C = { "<cmd>Telescope commands<cr>", "Commands" },
--     },
--
--     t = {
--         name = "Terminal",
--         -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
--         u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
--         t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
--         p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
--         f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
--         h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
--         v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
--     },
-- }
--
-- local vopts = {
--     mode = "v",     -- VISUAL mode
--     prefix = "<leader>",
--     buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true,  -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true,  -- use `nowait` when creating keymaps
-- }
-- -- toggle_linewise_op(vim.fn.visualmode())
-- local vmappings = {
--     ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle.linewise(vim.fn.visualmode())<CR>", "Comment" },
--     l = {
--         name = "Lsp",
--         a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
--     }
-- }
--
-- which_key.setup(setup)
-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)
--
--#regions

local normal_config = {
    { "<leader>/", "<cmd>lua require(\"Comment.api\").toggle.linewise.current()<CR>",                                                desc = "Comment",         mode = "n" },
    { "<leader>a", "<cmd>Alpha<cr>",                                                                                                 desc = "Alpha",           mode = "n" },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers",         mode = "n" },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>",                                                                                        desc = "Explorer",        mode = "n" },
    { "<leader>w", "<cmd>w!<CR>",                                                                                                    desc = "Save",            mode = "n" },
    { "<leader>q", "<cmd>q!<CR>",                                                                                                    desc = "Quit",            mode = "n" },
    { "<leader>c", "<cmd>bd<CR>",                                                                                                    desc = "Close buffer",    mode = "n" },
    { "<leader>h", "<cmd>nohlsearch<CR>",                                                                                            desc = "No Highlight",    mode = "n" },
    { "<leader>O", "<cmd>SymbolsOutline<CR>",                                                                                        desc = "Symbols Outline", mode = "n" },
    -- {"<leader>H", "<cmd>TSBufToggle highlight<CR>", desc="treesitter highlight", mode="n"},
    { "<leader>f", "<cmd>Telescope find_files<cr>",                                                                                  desc = "Find files",      mode = "n" },
    { "<leader>F", "<cmd>Telescope live_grep<cr>",                                                                                   desc = "Find Text",       mode = "n" },
    { "<leader>P", "<cmd>Telescope projects<cr>",                                                                                    desc = "Projects",        mode = "n" },
    { "<leader>u", "<cmd>TSUpdate all<cr>",                                                                                          desc = "Treesitter",      mode = "n" }
}

local lsp_config = {
    { "<leader>l",  group = "Lsp" },
    { "<leader>la", "<cmd>Lspsaga code_action<cr>",                     desc = "Code Action",           mode = "n" },
    { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>",      desc = "Document Diagnostics",  mode = "n" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                desc = "Code Format",           mode = "n" },
    { "<leader>li", "<cmd>LspInfo<cr>",                                 desc = "Info",                  mode = "n" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>",                          desc = "Installer Info",        mode = "n" },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",      desc = "Next Diagnostic",       mode = "n" },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",      desc = "Prev Diagnostic",       mode = "n" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action",       mode = "n" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",    desc = "Quickfix",              mode = "n" },
    { "<leader>lr", "<cmd>Lspsaga rename<cr>",                          desc = "Rename",                mode = "n" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols",      mode = "n" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols",     mode = "n" },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>",     desc = "Workspace Diagnostics", mode = "n" },
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
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE() direction=float<CR>",    desc = "Lazygit",           mode = "n" },
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
