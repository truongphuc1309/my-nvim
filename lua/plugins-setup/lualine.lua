local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#43455a',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#bf94f9',
    grey   = '#5f6a8f',
    yellow = '#e0af0c',
    green = '#4ffa7c',
}
local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.green } },
    command = { a = { fg = colors.black, bg = colors.yellow } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}
require('lualine').setup({
    options = {
        theme = bubbles_theme,
        disabled_filetypes = { 'packer', 'NvimTree' },
        component_separators = ')',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
})

