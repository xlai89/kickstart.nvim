-- NOTE: NIXCATS USERS:
-- NOTE: there are also notes added as a tutorial of how to use the nixCats lazy wrapper.
-- you can search for the following string in order to find them:
-- NOTE: nixCats:

-- like this one:
-- NOTE: nixCats: this just gives nixCats global command a default value
-- so that it doesnt throw an error if you didnt install via nix.
-- usage of both this setup and the nixCats command is optional,
-- but it is very useful for passing info from nix to lua so you will likely use it at least once.
require('nixCatsUtils').setup {
  non_nix_value = true,
}

if require('nixCatsUtils').isNixCats then
  print 'using nixCats'
end

--[[
-- Setup initial configuration,
-- 
-- Primarily just download and execute lazy.nvim
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NOTE: nixCats: You might want to move the lazy-lock.json file
local function getlockfilepath()
  if require('nixCatsUtils').isNixCats and type(nixCats.settings.unwrappedCfgPath) == 'string' then
    return nixCats.settings.unwrappedCfgPath .. '/lazy-lock.json'
  else
    return vim.fn.stdpath 'config' .. '/lazy-lock.json'
  end
end
local lazyOptions = {
  lockfile = getlockfilepath(),
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  { change_detection = { notify = false } },
}

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- NOTE: nixCats: this the lazy wrapper. Use it like require('lazy').setup() but with an extra
-- argument, the path to lazy.nvim as downloaded by nix, or nil, before the normal arguments.
require('nixCatsUtils.lazyCat').setup(
  nixCats.pawsible { 'allPlugins', 'start', 'lazy.nvim' },

  -- -- [[ Install `lazy.nvim` plugin manager ]]
  -- --    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
  -- local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  -- if not vim.loop.fs_stat(lazypath) then
  --   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  --   vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  -- end ---@diagnostic disable-next-line: undefined-field
  -- vim.opt.rtp:prepend(lazypath)
  --
  -- -- [[ Configure and install plugins ]]
  -- --
  -- --  To check the current status of your plugins, run
  -- --    :Lazy
  -- --
  -- --  You can press `?` in this menu for help. Use `:q` to close the window
  -- --
  -- --  To update plugins you can run
  -- --    :Lazy update
  -- --
  -- -- NOTE: Here is where you install your plugins.
  -- require('lazy').setup(
  {
    { import = 'custom/plugins' },

    -- NOTE: nixCats: instead of uncommenting them, you can enable them
    -- from the categories set in your packageDefinitions in your flake or other template!
    -- This is because within them, we used nixCats to check if it should be loaded!
    require 'kickstart.plugins.debug',
    require 'kickstart.plugins.indent_line',
    require 'kickstart.plugins.lint',
    require 'kickstart.plugins.autopairs',
    require 'kickstart.plugins.neo-tree',
    require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  },
  lazyOptions
)
