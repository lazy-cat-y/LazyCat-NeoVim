local bind = require("core.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

core_map = {
    ["n|Y"] = map_cmd("y$"):with_desc("edit: Yank text to EOL"),
    ["n|D"] = map_cmd("d$"):with_desc("edit: Delete text to EOL"),
    ["n|n"] = map_cmd("nzzzv"):with_noremap():with_desc("edit: Next search result"),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap():with_desc("edit: Prev search result"),
    ["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("edit: Join next line"),
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),

    ["i|jk"] = map_cmd("<Esc>"):with_desc("edit: Quit insert mode"),

    ["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
    ["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
}

bind.nvim_load_mapping(core_map)
