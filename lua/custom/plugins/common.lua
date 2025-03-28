return {

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  'github/copilot.vim',

  -- "gc" to comment visual regions/lines
  -- NOTE: nixCats: nix downloads it with a different file name.
  -- tell lazy about that.
  { 'numToStr/Comment.nvim', name = "comment.nvim", opts = {} },
  -- { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 
    'folke/todo-comments.nvim', 
    event = 'VimEnter', 
    dependencies = { 'nvim-lua/plenary.nvim' }, 
    opts = { signs = false }
  },
}
