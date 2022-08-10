local config = {}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
  install_info = {
    url = "https://github.com/milisims/tree-sitter-org",
    revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "org",
}

require("nvim-treesitter.configs").setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = { "org" }, -- Or run :TSUpdate org
}

config = {
  org_agenda_files = { "~/Dropbox/Org/*" },
  -- org_default_notes_file = "",
  org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
  diagnostics = true,
  -- org_todo_keyword_faces = {},
  -- org_hide_leading_stars = false,
  -- org_hide_emphasis_markers = false,
  -- org_ellipsis = "...",
  -- org_log_done = "time",
  org_highlight_latex_and_related = "entities",
  -- org_indent_mode = "indent",
}

return config
