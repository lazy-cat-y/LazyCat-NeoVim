return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        local opts = {
            background_colour = "#1e1e2e",
        }
        notify.setup(opts)
    end,
}
