local ts_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not ts_status_ok then
  return
end

--[[
    bg_dark = "#1f2335",
    bg = "#24283b",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
--]]

local ts_rainbow_colors = {
  "#cc241d",
  "#a89984",
  "#b16286",
  "#d79921",
  "#689d6a",
  "#d65d0e",
  "#458588",
}
local tn_status_ok, tn_colors = pcall(require, "tokyonight.colors")
if tn_status_ok then
  tn_colors = tn_colors.setup()
  ts_rainbow_colors = {
    "#e0af68",
    "#ff007c",
    "#7aa2f7",
    "#0db9d7",
    "#9d7cd8",
    "#9ece6a",
    "#db4b4b",
  }
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "mma", "mdx" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = { "mma", "mdx" },
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  tree_docs = {
    enable = true,
    keymap = {
      doc_node_at_cursor = "<leader>d",
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = ts_rainbow_colors, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
  },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --
  --     -- Automatically jump forward to textobj, similar to targets.vim
  --     lookahead = true,
  --
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ac"] = "@class.outer",
  --       ["ic"] = "@class.inner",
  --
  --       -- Or you can define your own textobjects like this
  --       ["iF"] = {
  --         python = "(function_definition) @function",
  --         cpp = "(function_definition) @function",
  --         c = "(function_definition) @function",
  --         java = "(method_declaration) @function",
  --       },
  --     },
  --   },
  -- },
}

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.wolfram = {
--   install_info = {
--     url = "~/projects/treesitter/tree-sitter-wolfram",
--     files = { "src/parser.c", "src/scanner.c" },
--   },
--   filetype = "mma",
--   used_by = { "wl", "wls", "mod", "gen", "fr" },
-- }
