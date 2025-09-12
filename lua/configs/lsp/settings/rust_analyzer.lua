return {
    settings = {
        ['rust-analyzer'] = {
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always", useParameterNames = true },
                implicitDrops = { enable = true },
                parameterHints = { enable = true },
                typeHints = { enable = true },
                enable = true,
            },
        },

    },
}
