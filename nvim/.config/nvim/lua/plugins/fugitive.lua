return {
  'tpope/vim-fugitive',
  cmd = {"Git", "Gdiffsplit"},
  keys = {
	  {"<leader>gs", "<cmd>Git<cr>", desc = "Git"},
	  {"<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff Split"}
  }
}
