-- Lua Line
-- Default Setup Copied from Readme of Repo

-- Creating Custom Theme
local colors = {
    lightgray = '#8B939A',
    skyblue = '#A1CAF1'
}
local custom_theme = require('lualine.themes.OceanicNext');

-- Changing Background of lualine_c section for Modes
custom_theme.normal.c.bg = colors.lightgray
custom_theme.insert.c.bg = colors.lightgray
custom_theme.visual.c.bg = colors.lightgray
custom_theme.replace.c.bg = colors.lightgray

-- Changing Foreground of lualine_b section for Modes
custom_theme.normal.b.fg = colors.skyblue
custom_theme.insert.b.fg = custom_theme.insert.a.bg
custom_theme.visual.b.fg = custom_theme.visual.a.bg
custom_theme.replace.b.fg = custom_theme.replace.a.bg

-- Changing Foreground of lualine_c section for Inactive
custom_theme.inactive.c.fg = colors.skyblue

-- Custom Extension For UndoTree
local undotree = {
    sections = {
        lualine_a = {
            { 'filetype',
                colored = false
            }
        },
        lualine_x = { 'location' }
    },
    filetypes = { 'undotree', 'diff' }
}

-- Custom Extension For NvimTree
local function get_short_cwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local nvimtree = {
    sections = {
        lualine_a = {
            { get_short_cwd,
                fmt = function(str)
                    if str == "~" then
                       return ""
                    end
                    return str:gsub("~/", " ")
                end
            }
        },
        lualine_x = { 'location' }
    },
    filetypes = { 'NvimTree' }
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'branch',
                fmt = function(str)
                    if string.len(str) > 10 then
                        return str:sub(1, 8) .. ".."
                    end
                    return str
                end
            },
            'diff',
            'diagnostics'
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {
            { 'filetype',
                colored = false
            },
            'location'
        },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    -- extensions = { 'fugitive', 'nvim-tree', undotree }
    -- Using My Custom NvimTree Funciton
    extensions = { 'fugitive', nvimtree, undotree }
}
