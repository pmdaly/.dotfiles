return {
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  dependencies = {'nvim-lua/plenary.nvim'}
  },
  {
        'eddyekofo94/gruvbox-flat.nvim',
        enabled = true,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox-flat]]) 
        end,
  },
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  },
}
