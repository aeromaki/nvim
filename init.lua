local vim = vim
local Plug = vim.fn['plug#']
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')

Plug('rktjmp/lush.nvim')
Plug('aeromaki/TripleBaka.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-tree.lua')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('RRethy/vim-illuminate')

Plug('m4xshen/autoclose.nvim')
Plug('famiu/bufdelete.nvim')

vim.call('plug#end')




vim.cmd('colorscheme TripleBaka')

local colors = {
  white = '#ffffff',
  black = '#323232',
  lightgray = '#eeeeee',
  gray = '#dddddd',
  red = '#e24673',
  yellow = '#ffd543',
  blue = '#39c5bb'
}

local lualine_b = { bg = colors.lightgray, fg = colors.black }
local lualine_c = { bg = colors.gray, fg = colors.black }

local theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  insert = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  visual = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  replace = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  command = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
  inactive = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
    b = lualine_b, c = lualine_c
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
    --always_divide_middle = false
  },
  sections = {
    lualine_b = {
      'branch',
      --'diff'
    },
    lualine_c = {{
      'filename',
      file_status = true,
      path = 2
    }},
    lualine_x = {
      'filetype'
    },
    lualine_y = {
      'diagnostics',
      --'lsp_status'
    },
    lualine_z = {
      'location'
    }
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

vim.cmd('hi def IlluminatedWordText gui=bold,underline')
vim.cmd('hi def IlluminatedWordRead gui=bold,underline')
vim.cmd('hi def IlluminatedWordWrite gui=bold,underline')




require('autoclose').setup({
  options = {
    pair_spaces = true
  }
})




function TabLineCell(i)
  local isSelected = vim.fn.tabpagenr() == i
  local buflist = vim.fn.tabpagebuflist(i)
  local winnr = vim.fn.tabpagewinnr(i)
  local bufnr = buflist[winnr]
  local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

  local name = vim.fn.bufname(bufnr)
  if name == '' then
    name = '[No Name]'
  end

  local modified = vim.fn.getbufvar(bufnr, '&modified') == 1 and '[+] ' or ''

  return hl .. '%' .. i .. 'T' .. ' ' .. name .. modified .. ' '
end
function TabLine()
  local line = ''
  for i = 1, vim.fn.tabpagenr('$'), 1 do
    line = line .. TabLineCell(i)
  end
  line = line .. '%#TabLineFill#%='
  return line
end
vim.opt.tabline = '%!v:lua.TabLine()'




vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scl = 'no'
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"




vim.keymap.set('i', '<C-s>c', '', { callback = cmp.complete })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>q', '<Esc>:tabnew<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>r', '<Esc>:tabclose<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>w', '<Esc>:tabprevious<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>e', '<Esc>:tabnext<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>t', '<Esc>:NvimTreeToggle<CR>')
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev bdd bd')
vim.cmd('cnoreabbrev bd Bd')
vim.cmd('cnoreabbrev bww bw')
vim.cmd('cnoreabbrev bw Bw')

