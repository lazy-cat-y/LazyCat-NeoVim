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

    ["i|jk"] = map_cmd("<Esc>"):with_desc("edit: Quit insert mode"),
}

bind.nvim_load_mapping(core_map)
