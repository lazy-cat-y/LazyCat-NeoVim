return {
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                enable = true,
                typeHints = { enable = true },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
                bindingModeHints = { enable = true },
                lifetimeElisionHints = { enable = "always", useParameterNames = true },
                closureReturnTypeHints = { enable = "always" },
                reborrowHints = { enable = "always" },
                implicitDrops = { enable = true },
            },
        },
    },
}
