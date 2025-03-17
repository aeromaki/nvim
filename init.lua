local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rktjmp/lush.nvim')
Plug('aeromaki/miku-black.nvim')
Plug('nvim-lualine/lualine.nvim')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

vim.call('plug#end')

vim.cmd('colorscheme miku-black')


local colors = {
  white = '#d9d9d9',
  black = '#101010',
  bg = '#101010',
  red = '#e24673',
  green = '#13868c',
  blue = '#39c5bb'
}

local theme = {
  normal = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
  visual = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
  replace = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
  command = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.white, fg = colors.black },
    c = { bg = colors.black, fg = colors.white },
  },
}


require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  }
})


require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  additional_vim_regex_highlighting = false
})

local lspconfig = require('lspconfig')
lspconfig.pyright.setup({})

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scl = 'no'
