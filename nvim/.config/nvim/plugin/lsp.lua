-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- lsp saga
local saga = require('lspsaga')
saga.init_lsp_saga {
  error_sign = '✘',
  warn_sign = '⚠',
  hint_sign = '⚠',
  infor_sign = '⚠',
  border_style = "round",
  max_preview_lines = 20
}

-- Language servers to use
local lsp = require('lspconfig')

lsp.bashls.setup{}
lsp.cmake.setup{}
lsp.html.setup{}
lsp.pyright.setup{}
lsp.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
lsp.graphql.setup{}
lsp.metals.setup{}
lsp.solang.setup{}
lsp.sqls.setup{}
lsp.tsserver.setup{}
lsp.yamlls.setup{}
lsp.vimls.setup{}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  },
}
