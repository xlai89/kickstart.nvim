return 
{ -- markdown preview: commented out because cannot open browser in WSL
  'toppair/peek.nvim',
  enabled = false,
  build = 'deno task --quiet build:fast',
  event = { 'VeryLazy' },
  keys = {
    {
      '<leader>op',
      function()
        local peek = require 'peek'
        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end,
      desc = 'Peek (Markdown Preview)',
    },
  },
  opts = { theme = 'dark', app = 'chromium' },
}
