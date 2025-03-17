local vim = vim
local Plug = vim.fn['plug#']
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')

Plug('rktjmp/lush.nvim')
Plug('aeromaki/miku-black.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-tree.lua')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')

vim.call('plug#end')




vim.cmd('colorscheme miku-black')

local colors = {
  white = '#d9d9d9',
  black = '#101010',
  red = '#e24673',
  green = '#13868c',
  blue = '#39c5bb'
}

local lualine_b = { bg = colors.black, fg = colors.white }
local lualine_c = { bg = colors.black, fg = colors.white }

local theme = {
  normal = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  visual = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  replace = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  command = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  inactive = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  },
  sections = {
    lualine_b = { 'branch', 'diagnostics' }
  }
})

require('nvim-tree').setup({
  sort = {
    sorter = 'case_sensitive'
  },
  filters = {
    dotfiles = false
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        hidden = false,
        diagnostics = false,
        bookmarks = false
      }
    }
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

local cmp = require('cmp')
local cmp_f = function(f)
  return function(fallback)
    if cmp.visible() then
      f()
    else
      fallback()
    end
  end
end
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    --['<C-j>'] = cmp_f(cmp.mapping.scroll_docs(-4)),
    --['<C-k>'] = cmp_f(cmp.mapping.scroll_docs(4)),
    ['<Tab>'] = cmp_f(cmp.mapping.select_next_item()),
    ['<S-Tab>'] = cmp_f(cmp.mapping.select_prev_item()),
    ['<C-q>'] = cmp_f(cmp.mapping.abort()),
    ['<CR>'] = cmp_f(cmp.mapping.confirm({ select = true }))
  }),
  sources = {
    { name = 'nvim_lsp' }
  }
})

local lspSetup = {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lspSetup)
lspconfig.vimls.setup(lspSetup)
lspconfig.pyright.setup(lspSetup)
lspconfig.ts_ls.setup(lspSetup)
lspconfig.rust_analyzer.setup(lspSetup)




vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scl = 'no'
vim.opt.laststatus = 3




vim.keymap.set('i', '<C-s>c', '', { callback = cmp.complete })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>q', '<Esc>:tabnew<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>r', '<Esc>:tabclose<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>w', '<Esc>:tabprevious<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>e', '<Esc>:tabnext<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>t', '<Esc>:NvimTreeToggle<CR>')
