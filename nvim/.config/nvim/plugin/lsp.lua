-- Language servers to use
local lsp = require'lspconfig'
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
vim.o.completeopt = 'menu,menuone,noinsert,noselect,preview'
  --completion = {
   -- completeopt = "menu,menuone,noinsert,noselect",
  --},

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
    end,
  },
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
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'vsnip' }
  },
}
