local vim = vim

local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')
--Plug('rktjmp/lush.nvim')
--Plug('rxils/triplebaka-dark')
Plug('nvim-lualine/lualine.nvim')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')
Plug('RRethy/vim-illuminate')

Plug('windwp/nvim-autopairs')
Plug('famiu/bufdelete.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('HiPhish/rainbow-delimiters.nvim')

vim.call('plug#end')


local vimrc = vim.fn.stdpath('config') .. '/theme.vim'
vim.cmd.source(vimrc)

require("nvim-tree").setup({
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


require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = require('./theme-lualine'),
    component_separators = { left = ' ', right = ' ' },
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




require('nvim-treesitter.configs').setup({
  --ensure_installed = 'all',
  sync_install = false,
  --auto_install = true,
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
    ['<Tab>'] = cmp_f(cmp.mapping.select_next_item()),
    ['<S-Tab>'] = cmp_f(cmp.mapping.select_prev_item()),
    ['<C-q>'] = cmp_f(cmp.mapping.abort()),
    ['<CR>'] = cmp_f(cmp.mapping.confirm({ select = true }))
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' }
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
lspconfig.r_language_server.setup(lspSetup)
lspconfig.julials.setup(lspSetup)

vim.cmd('hi def IlluminatedWordText gui=bold,underline')
vim.cmd('hi def IlluminatedWordRead gui=bold,underline')
vim.cmd('hi def IlluminatedWordWrite gui=bold,underline')


require('nvim-autopairs').setup({})

local rainbowHighlight = {
  "RainbowYellow",
  "RainbowRed",
  "RainbowGreen",
}

local hooks = require('ibl.hooks')
hooks.register(hooks.type.HIGHLIGHT_SETUP, function ()
  vim.api.nvim_set_hl(0, "BlankLine", { ctermfg = 8 })
  vim.api.nvim_set_hl(0, "RainbowRed", { ctermfg = 9 })
  vim.api.nvim_set_hl(0, "RainbowYellow", { ctermfg = 11 })
  vim.api.nvim_set_hl(0, "RainbowGreen", { ctermfg = 10 })
end)

vim.g.rainbow_delimiters = { highlight = rainbowHighlight }

require('ibl').setup({
  indent = {
    highlight = {
      "BlankLine"
    }
  },
  scope = {
    enabled = false,
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
vim.opt.colorcolumn = "80"
--vim.o.termguicolors = true

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3

vim.diagnostic.config({ virtual_text = false })



vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>d', '',
  { callback = vim.diagnostic.goto_next })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>s', '',
  { callback = vim.diagnostic.goto_prev })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>q', '<Esc>:tabnew<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>r', '<Esc>:tabclose<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>w', '<Esc>:tabprevious<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>e', '<Esc>:tabnext<CR>')
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:Lexplore<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:NvimTreeToggle<CR>')
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev bdd bd')
vim.cmd('cnoreabbrev bd Bd')
vim.cmd('cnoreabbrev bww bw')
vim.cmd('cnoreabbrev bw Bw')
