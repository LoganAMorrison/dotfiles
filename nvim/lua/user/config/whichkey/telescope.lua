local FilePickers = {
   name = "File",
   -- Lists files in your current working directory, respects .gitignore
   f = { "", "Find Files" },
   -- Fuzzy search through the output of git ls-files command, respects
   -- .gitignore, optionally ignores untracked files
   c = { "", "Git Files" },
   -- Lists files and folders in your current working directory, open files,
   -- navigate your filesystem, and create new files and folders
   b = { "", "Browse" },
   -- Searches for the string under your cursor in your current working
   -- directory
   s = { "", "Grep String" },
   -- Search for a string in your current working directory and get results
   -- live as you type (respecting .gitignore)
   l = { "", "Live Grep" },
}

local VimPickers = {
   name = "Vim",
   -- builtin.buffers 	Lists open buffers in current neovim instance
   b = { "<cmd>Telescope buffers<cr>", "Buffers" },
   -- builtin.pickers 	Lists the previous pickers incl. multi-selections
   -- (see :h telescope.defaults.cache_picker)
   p = { "<cmd>Telescope pickers<cr>", "Pickers" },
   -- builtin.current_buffer_fuzzy_find 	Live fuzzy search inside of the
   -- currently open buffer
   f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in Buffer" },

   -- Lists spelling suggestions for the current word under the cursor,
   -- replaces word with selected suggestion on <cr>
   s = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggest" },
   -- Lists available plugin/user commands and runs them on <cr>
   c = { "<cmd>Telescope commands<cr>", "Commands" },
   -- Lists normal mode keymappings
   k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
   -- Lists items in the quickfix list
   q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
   -- Lists available colorschemes and applies them on <cr>
   t = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
   h = {
      name = "History",
      -- searches that were executed recently, and reruns them on <cr>
      s = { "<cmd>Telescope search_history<cr>", "Search History" },
      -- Lists commands that were executed recently, and reruns them on <cr>
      c = { "<cmd>Telescope command_history<cr>", "Command History" },
      -- Lists previously open files
      f = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      -- Lists the results incl. multi-selections of the previous picker
      r = { "<cmd>Telescope resume<cr>", "Resume" },
   },
   -- Lists manpage entries, opens them in a help window on <cr>
   m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
   -- Lists vim registers, pastes the contents of the register on <cr>
   r = { "<cmd>Telescope registers<cr>", "Registers" },

   v = {
      name = "Vim",
      -- Lists vim autocommands and goes to their declaration on <cr>
      a = { "<cmd>Telescope autocommands<cr>", "AutoCommands" },
      -- Lists vim options, allows you to edit the current value on <cr>
      o = { "<cmd>Telescope vim_options<cr>", "Options" },
      -- Lists vim marks and their value
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      -- Lists tags in current directory with tag location file preview (users are
      -- required to run ctags -R to generate tags or update when introducing new changes)
      t = {
         name = "Tags",
         t = { "<cmd>Telescope tags<cr>", "Tags" },
         -- Lists available help tags and opens a new window
         -- with the relevant help info on <cr>
         h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
         -- Lists all of the tags for the currently
         -- open buffer, with a preview
         b = { "<cmd>Telescope current_buffer_tags<cr>", "Buffer Tags" },
      },
      -- Lists all available filetypes
      f = { "<cmd>Telescope filetypes<cr>", "FileTypes" },
      -- Lists all available highlights
      h = { "<cmd>Telescope highlights<cr>", "Highlights" },
      -- Lists items from the current window's location list
      l = { "<cmd>Telescope loclists<cr>", "LocList" },
   },
}

local LspPickers = {
   name = "Lsp",
   -- Neovim LSP Pickers
   -- Lists LSP references for word under the cursor
   r = { "<cmd>Telescope lsp_references<cr>", "References" },
   -- Lists LSP document symbols in the current buffer
   -- Lists LSP document symbols in the current workspace
   -- Dynamically Lists LSP for all workspace symbols
   s = {
      name = "Symbols",
      w = { "<cmd>Telescope lsp_document_symbols<cr>", "Workspace Symbols" },
      b = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Buffer Symbols" },
      d = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Dynamic Workspace Symbols" },
   },
   a = {
      name = "Code Actions",
      -- Lists any LSP actions for the word under the cursor, that can be
      -- triggered with <cr>
      a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" },
      -- Lists any LSP actions for a given range, that can be triggered with <cr>
      r = { "<cmd>Telescope lsp_range_code_actions<cr>", "Range Code Actions" },
   },
   -- Lists Diagnostics for all open buffers or a specific buffer. Use option
   -- bufnr=0 for current buffer.
   d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
   g = {
      name = "Goto",
      i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
   },
}

local GitPickers = {
   name = "Git",
   -- Lists git commits with diff preview, checkout action <cr>, reset mixed
   -- <C-r>m, reset soft <C-r>s and reset hard <C-r>h
   c = { "<cmd>Telescope git_commits<cr>", "Commits" },
   -- builtin.git_bcommits 	Lists buffer's git commits with diff preview and
   -- checks them out on <cr>
   C = { "<cmd>Telescope git_bcommits<cr>", "Buffer's Commits" },
   -- Lists all branches with log preview, checkout action <cr>, track action
   -- <C-t> and rebase action<C-r>
   b = { "<cmd>Telescope git_branches<cr>", "Commits" },
   -- builtin.git_status 	Lists current changes per file with diff preview and
   -- add action. (Multi-selection still WIP)
   s = { "<cmd>Telescope git_status<cr>", "Status" },
   -- builtin.git_stash 	Lists stash items in current repository with ability
   -- to apply them on <cr>
   S = { "<cmd>Telescope git_stash<cr>", "Stash" },
}

local TreesitterPickers = {
   name = "Treesitter",
   -- Lists Function names, variables, from Treesitter!
   t = { "<cmd>Telescope treesitter<cr>", "Commits" },
}

--Lists Picker
local ListsPickers = {
   name = "Lists",
   -- builtin.planets 	Use the telescope...
   p = { "<cmd>Telescope planets<cr>", "Planets" },
   -- builtin.builtin 	Lists Built-in pickers and run them on <cr>.
   b = { "<cmd>Telescope builtin<cr>", "Builtin" },
   -- builtin.reloader 	Lists Lua modules and reload them on <cr>.
   r = { "<cmd>Telescope reloader<cr>", "Reloader" },
   -- builtin.symbols 	Lists symbols inside a file data/telescope-sources/*.json found in your rtp. More info and symbol
   -- sources can be found here: https://github.com/nvim-telescope/telescope-symbols.nvim
   s = { "<cmd>Telescope symbols<cr>", "Symbols" },
}

local WhichKeyTelescope = {
   name = "Telescope",
   f = FilePickers,
   v = VimPickers,
   l = LspPickers,
   g = GitPickers,
   t = TreesitterPickers,
   L = ListsPickers,
}

return WhichKeyTelescope
