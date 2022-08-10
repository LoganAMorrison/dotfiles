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

-- 'vhyrro/neorg' -  Modernity meets insane extensibility. The future of organizing your life in Neovim.
-- 'kristijanhusak/orgmode.nvim' - Orgmode clone written in Lua for Neovim 0.5+.

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  -- use {"williamboman/nvim-lsp-installer"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
  use { "tamago324/nlsp-settings.nvim" } -- language server settings defined in json for
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "nvim-lua/lsp-status.nvim" }
  use { "kkharji/lspsaga.nvim" }
  use { "onsails/lspkind-nvim" }
  use { "nvim-lua/lsp_extensions.nvim" }
  use { "kosayoda/nvim-lightbulb" }
  use { "lvimuser/lsp-inlayhints.nvim", branch = "readme" }
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end,
  }

  -- UI
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use { "nvim-lualine/lualine.nvim" }
  use "goolord/alpha-nvim"
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "folke/todo-comments.nvim" }

  -- Utils
  use "anuvyklack/hydra.nvim"
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, tag = "nightly" }
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use { "folke/which-key.nvim" }
  use { "rcarriga/nvim-notify" }

  -- Language
  use "lervag/vimtex"
  use { "simrat39/rust-tools.nvim" }
  use "voldikss/vim-mma"
  use "google/vim-maktaba"
  use "bazelbuild/vim-bazel"
  use "fladson/vim-kitty"
  use "jxnblk/vim-mdx-js"

  -- Orgmode
  -- use {
  --   "nvim-orgmode/orgmode",
  --   config = function()
  --     require("orgmode").setup {
  --       require "user.orgmode",
  --     }
  --   end,
  -- }
  -- Performance
  use "nathom/filetype.nvim"
  use "lewis6991/impatient.nvim"
  use "karb94/neoscroll.nvim"

  -- Lua
  use "folke/lua-dev.nvim"

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "tjdevries/colorbuddy.nvim"
  use "rebelot/kanagawa.nvim"
  use { "norcalli/nvim-colorizer.lua" }
  use "folke/twilight.nvim"
  use { "folke/zen-mode.nvim", requires = "folke/twilight.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  -- use { "nvim-telescope/telescope-ui-select.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-tree-docs"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"

  -- Git
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }

  use {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  }
end)
