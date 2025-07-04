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
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
  }
}
