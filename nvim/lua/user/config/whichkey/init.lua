local WhichKeyConfig = {}

WhichKeyConfig.setup = function()
   local which_key = require "which-key"

   which_key.setup {
      plugins = {
         marks = true, -- shows a list of your marks on ' and `
         registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
         -- the presets plugin, adds help for a bunch of default keybindings in Neovim
         -- No actual key bindings are created
         presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
         },
         spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
      },
      icons = {
         breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
         separator = "➜", -- symbol used between a key and it's label
         group = "+", -- symbol prepended to a group
      },
      window = {
         border = "single", -- none, single, double, shadow
         position = "bottom", -- bottom, top
         margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
         padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
         height = { min = 4, max = 25 }, -- min and max height of the columns
         width = { min = 20, max = 50 }, -- min and max width of the columns
         spacing = 3, -- spacing between columns
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
   }

   local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
   }
   local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
   }
   -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
   -- see https://neovim.io/doc/user/map.html#:map-cmd
   local vmappings = {
      ["/"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
   }
   local mappings = {
      ["w"] = { "<cmd>w!<CR>", "Save" },
      ["q"] = { "<cmd>q!<CR>", "Quit" },
      ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
      ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
      ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
      ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
      b = require "user.config.whichkey.buffers",
      p = require "user.config.whichkey.packer",
      g = require "user.config.whichkey.git",
      l = require "user.config.whichkey.lsp",
      t = require "user.config.whichkey.telescope",
      T = {
         name = "Treesitter",
         i = { ":TSConfigInfo<cr>", "Info" },
      },
   }
   which_key.register(mappings, opts)
   which_key.register(vmappings, vopts)
end

return WhichKeyConfig
