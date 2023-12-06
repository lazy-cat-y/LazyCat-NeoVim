local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

local status_ok_color, color = pcall(require, "configs.utils.colors")
if not status_ok_color then
    return
end

local colors = {
    background = color.get("background", true),
    fontground = color.get("fontground", true),
    base = color.get("base", true),
}

local function custom_areas_right()
    local result = {}
    local seve = vim.diagnostic.severity
    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

    if error ~= 0 then
        table.insert(result, { text = "  " .. error, fg = colors.base.red, bg = colors.background.bg1 })
    end

    if warning ~= 0 then
        table.insert(result, { text = "  " .. warning, fg = colors.base.yellow, bg = colors.background.bg1 })
    end

    if hint ~= 0 then
        table.insert(result, { text = "  " .. hint, fg = colors.base.orange, bg = colors.background.bg1 })
    end

    if info ~= 0 then
        table.insert(result, { text = "  " .. info, fg = colors.base.blue, bg = colors.background.bg1 })
    end
    return result
end

bufferline.setup({
    options = {
        numbers = "none",                    -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator_icon = nil,
        indicator = { style = "icon", icon = "▎" },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,   -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
        custom_areas = { right = custom_areas_right },
        highlights = {
            fill = {
                fg = { attribute = "fg", highlight = "Visual" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            background = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },

            buffer_selected = {
                fg = { attribute = 'fg', highlight = '#ff0000' },
                bg = { attribute = 'bg', highlight = '#0000ff' },
                gui = 'none'
            },
            buffer_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },

            close_button = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            close_button_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            close_button_selected = {
                fg = { attribute = 'fg', highlight = 'TabLineSel' },
                bg = { attribute = 'bg', highlight = 'TabLineSel' }
            },

            tab_selected = {
                fg = { attribute = "fg", highlight = "Normal" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
            tab = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            tab_close = {
                -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
                fg = { attribute = "fg", highlight = "TabLineSel" },
                bg = { attribute = "bg", highlight = "Normal" },
            },

            duplicate_selected = {
                fg = { attribute = "fg", highlight = "TabLineSel" },
                bg = { attribute = "bg", highlight = "TabLineSel" },
                underline = true,
            },
            duplicate_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
                underline = true,
            },
            duplicate = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
                underline = true,
            },

            modified = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            modified_selected = {
                fg = { attribute = "fg", highlight = "Normal" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
            modified_visible = {
                fg = { attribute = "fg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },

            separator = {
                fg = { attribute = "bg", highlight = "TabLine" },
                bg = { attribute = "bg", highlight = "TabLine" },
            },
            separator_selected = {
                fg = { attribute = "bg", highlight = "Normal" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
            -- separator_visible = {
            --   fg = {attribute='bg',highlight='TabLine'},
            --   bg = {attribute='bg',highlight='TabLine'}
            --   },
            indicator_selected = {
                fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
                bg = { attribute = "bg", highlight = "Normal" },
            },
        },
    }
})
