local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    background = require("configs.utils.colors").get("background", true),
    fg = require("configs.utils.colors").get("fontground", true),
    base = require("configs.utils.colors").get("base", true)
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg.fg0, bg = colors.background.bg0 } },
            inactive = { c = { fg = colors.fg.fg0, bg = colors.background.bg0 } },
        },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return '▊'
    end,
    color = { fg = colors.base.blue },
    padding = { left = 0, right = 1 }
})

-- mode
ins_left({
    function()
        return ''
    end,

    color = function()
        local mode_color = {
            n = colors.base.green,
            i = colors.base.red,
            v = colors.base.blue,
            [''] = colors.base.blue,
            V = colors.base.blue,
            c = colors.base.magenta,
            no = colors.base.green,
            s = colors.base.orange,
            S = colors.base.orange,
            [''] = colors.base.orange,
            ic = colors.base.yellow,
            R = colors.base.violet,
            Rv = colors.base.violet,
            cv = colors.base.red,
            ce = colors.base.red,
            r = colors.base.cyan,
            rm = colors.base.cyan,
            ['r?'] = colors.base.cyan,
            ['!'] = colors.base.red,
            t = colors.base.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 }
})

ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.base.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg.fg0, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = '󰅚 ', warn = '󰀪 ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.base.red },
        color_warn = { fg = colors.base.yellow },
        color_info = { fg = colors.base.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = colors.base.cyan, gui = 'bold' },
}


ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.base.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.base.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.base.violet, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = ' ', removed = ' ' },
    diff_color = {
        added = { fg = colors.base.green },
        modified = { fg = colors.base.orange },
        removed = { fg = colors.base.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return '▊'
    end,
    color = { fg = colors.base.blue },
    padding = { left = 1, right = 0 },
}

lualine.setup(config)
