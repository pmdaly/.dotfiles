-- Language servers to use
local lspkind = require "lspkind"
lspkind.init()

-- *Must* be *S*olidity not solidity
require "nvim-treesitter.parsers".get_parser_configs().Solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = {"src/parser.c"},
    requires_generate_from_grammar = true,
  },
  filetype = 'solidity'
}

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- do I even need this below?
--local lsp = require'lspconfig'

--lsp.bashls.setup{}
--lsp.cmake.setup{}
--lsp.html.setup{}
--lsp.pyright.setup{}
--lsp.gopls.setup{
--    cmd = {"gopls", "serve"},
--    settings = {
--        gopls = {
--            analyses = {
--                unusedparams = true,
--            },
--            staticcheck = true,
--        },
--    },
--}
--lsp.graphql.setup{}
--lsp.metals.setup{}
--lsp.rust_analyzer.setup{
--  settings = {
--      ["rust-analyzer"] = {
--          assist = {
--              importGranularity = "module",
--              importPrefix = "by_self",
--          },
--          cargo = {
--              loadOutDirsFromCheck = true
--          },
--          procMacro = {
--              enable = true
--          },
--      }
--  }
--}
--lsp.solang.setup{}
--lsp.sqls.setup{}
--lsp.tsserver.setup{}
--lsp.yamlls.setup{}
--lsp.vimls.setup{}

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
    { name = "vsnip" },
    { name = "nvim_lua" },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        vsnip = "[snip]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
}
