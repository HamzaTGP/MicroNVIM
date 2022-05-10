
-------------------
-- Plugin Config --
-------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

-- toggleterm
require("toggleterm").setup{}

-- Wilder menu
use {
  'gelguy/wilder.nvim',
}

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer({
  -- highlighter applies highlighting to the candidates
  highlighter = wilder.basic_highlighter(),
}))

wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}))

-- Nvim Tree File Explorer
  use {
  'kyazdani42/nvim-tree.lua',
  cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  config = function()
    require('nvim-tree').setup {
      update_focused_file = {enable = true, update_cwd = true}
    }
  end
}
  use "wbthomason/packer.nvim"            -- Have packer manage itself
  use 'nvim-treesitter/nvim-treesitter'   -- Treesitter interface
  use "nvim-lualine/lualine.nvim"         -- Better Status Line
  use "kyazdani42/nvim-web-devicons"      -- Cool Icons
  use "terrortylor/nvim-comment"          -- Nvim Comment
  use "lewis6991/gitsigns.nvim"           -- Git sings Git Diff...
  use "norcalli/nvim-colorizer.lua"       -- Colors
  use "shaunsingh/nord.nvim"              -- Nord Color Scheme
  use "goolord/alpha-nvim"                -- Wellcome Screen
  use "hrsh7th/nvim-cmp"                  -- Auto Complete
  use "hrsh7th/cmp-buffer"                -- Buffer Completion
  use "hrsh7th/cmp-path"                  -- Path Completion
  use "L3MON4D3/LuaSnip"                  -- LuaSnip (requird by nvim-cmp)
  use "lewis6991/impatient.nvim"          -- Speed up loading Lua modules in Neovim to improve startup time.
  use "BenGH28/neo-runner.nvim"           -- Run C/C++ and Python programs
  use {'neoclide/coc.nvim', branch = 'release'}                -- C/C++ autocompletion
  use "simnalamburt/vim-mundo"            -- Undo management
  use "neovim/nvim-lspconfig"             -- LSP support
  use "akinsho/toggleterm.nvim"           -- Better terminal integration
  -- use "dstein64/vim-startuptime"          -- A Vim plugin for profiling Vim's startup time.

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
