local bind = require("core.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local core_map = {
    -- Suckless
    -- ["n|<C-s>"] = map_cu("write"):with_noremap():with_silent():with_desc("edit: Save file"),
    ["n|Y"] = map_cmd("y$"):with_desc("edit: Yank text to EOL"),
    ["n|D"] = map_cmd("d$"):with_desc("edit: Delete text to EOL"),
    ["n|n"] = map_cmd("nzzzv"):with_noremap():with_desc("edit: Next search result"),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap():with_desc("edit: Prev search result"),
    ["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("edit: Join next line"),
    ["n|<Esc>"] = map_cr("noh"):with_noremap():with_silent():with_desc("edit: Clear search highlight"),
    -- ["n|<leader>sv"] = map_cmd("<C-w>v"):with_noremap():with_desc("window: Open new window at left"),
    -- ["n|<leader>sh"] = map_cmd("<C-w>s"):with_noremap():with_desc("window: Open new window at bottom"),
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),
    ["t|<C-h>"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap():with_desc("window: Focus left"),
    ["t|<C-l>"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap():with_desc("window: Focus right"),
    ["t|<C-j>"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap():with_desc("window: Focus down"),
    ["t|<C-k>"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap():with_desc("window: Focus up"),
    ["n|<A-[>"] = map_cr("vertical resize -5CSCI 570"):with_silent():with_desc("window: Resize -5 vertically"),
    ["n|<A-]>"] = map_cr("vertical resize +5"):with_silent():with_desc("window: Resize +5 vertically"),
    ["n|<A-;>"] = map_cr("resize -2"):with_silent():with_desc("window: Resize -2 horizontally"),
    ["n|<A-'>"] = map_cr("resize +2"):with_silent():with_desc("window: Resize +2 horizontally"),
    ["n|<C-q>"] = map_cr("wq"):with_desc("edit: Save file and quit"),
    ["n|<A-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
    ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"):with_desc("edit: Toggle spell check"),
    ["n|tn"] = map_cr("tabnew"):with_noremap():with_silent():with_desc("tab: Create a new tab"),
    ["n|tk"] = map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),
    ["n|tj"] = map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
    ["n|to"] = map_cr("tabonly"):with_noremap():with_silent():with_desc("tab: Only keep current tab"),

    -- Insert mode
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("edit: Delete previous block"),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
    ["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
    ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_desc("edit: Save file"),
    ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"):with_desc("edit: Save file and quit"),
    ["i|jk"] = map_cmd("<Esc>"):with_desc("edit: Quit insert mode");
    -- Command mode
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("edit: End"),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
        :with_noremap()
        :with_desc("edit: Complete path of current file"),
    -- Visual mode
    ["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
    ["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
    ["v|<"] = map_cmd("<gv"):with_desc("edit: Decrease indent"),
    ["v|>"] = map_cmd(">gv"):with_desc("edit: Increase indent"),

    -- NvimTree
    -- ["n|<leader>e"] = map_cr("NvimTreeToggle<CR>"):with_noremap():with_silent():with_desc("tab: Open and close Nvim-tree"),

    -- Telescope
    -- ["n|<C-f>"] = map_cr("Telescope live_grep<CR>"):with_noremap():with_silent():with_desc("find: Find grep key"),
    -- ["n|ff"] = map_cr("Telescope find_files<CR>"):with_noremap():with_silent():with_desc("find: Find grep key"),

    -- Null ls
    -- ["n|bf"] = map_cr("lua vim.lsp.buf.format()<CR>"):with_noremap():with_silent():with_desc("edit: Format the code file"),

    -- Buffer line
    -- ["n|<C-S-l>"] = map_cr("bnext<CR>"):with_noremap():with_silent():with_desc("tab: Move to next buffer"),
    -- ["n|<C-S-h>"] = map_cr("bprevious<CR>"):with_noremap():with_silent():with_desc("tab: Move to last buffer"),
    -- which key
    -- ["n|<leader>k"] = map_cr("WhichKey"):with_noremap():with_silent():with_desc("window: Open which key"),
}

bind.nvim_load_mapping(core_map)
