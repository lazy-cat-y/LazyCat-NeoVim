return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = false,
            auto_trigger = true,
            hide_during_completion = true,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            ["*"] = true
        },
    },
}
