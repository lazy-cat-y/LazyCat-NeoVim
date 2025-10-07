return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        npairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
            },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
            disable_filetype = { "TelescopePrompt", "vim" },
            map_cr = true,
        })

        npairs.add_rule(Rule("/**", "  */"):with_pair(cond.not_after_regex(
        --> INJECT: luap
            ".-%*/",
            -1
        )):set_end_pair_length(3))
    end
}
