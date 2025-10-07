return {
    "goolord/alpha-nvim",
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[  ▄▄▌   ▄▄▄· ·▄▄▄▄• ▄· ▄▌     ▄▄·  ▄▄▄· ▄▄▄▄▄  ]],
            [[  ██•  ▐█ ▀█ ▪▀·.█▌▐█▪██▌    ▐█ ▌▪▐█ ▀█ •██    ]],
            [[  ██▪  ▄█▀▀█ ▄█▀▀▀•▐█▌▐█▪    ██ ▄▄▄█▀▀█  ▐█.▪  ]],
            [[  ▐█▌▐▌▐█ ▪▐▌█▌▪▄█▀ ▐█▀·.    ▐███▌▐█ ▪▐▌ ▐█▌·  ]],
            [[  .▀▀▀  ▀  ▀ ·▀▀▀ •  ▀ •     ·▀▀▀  ▀  ▀  ▀▀▀   ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰍉  Find file", ":FzfLua files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "󰙰  Recently used files", ":FzfLua oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":FzfLua live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "󰌵  Quit Neovim", ":qa<CR>"),
        }

        local function footer()
            return "github.com/lazy-cat-y"
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
        alpha.setup(dashboard.opts)
    end,
}
