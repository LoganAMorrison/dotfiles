-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- Common folders/files created tools which I don't need to see
local custom_filters = {}
-- git
table.insert(custom_filters, ".git")
-- cpp
table.insert(custom_filters, "build")
-- Jetbrains cpp
table.insert(custom_filters, "cmake-build-debug")
table.insert(custom_filters, "cmake-build-release")
-- python
table.insert(custom_filters, ".mypy_cache")
table.insert(custom_filters, "__pycache__")
table.insert(custom_filters, ".cache")
table.insert(custom_filters, ".eggs")
table.insert(custom_filters, ".pytest_cache")
-- node
table.insert(custom_filters, "node_modules")
-- IDEs
table.insert(custom_filters, ".idea")
table.insert(custom_filters, ".vscode")

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  -- auto_close = true,
  auto_reload_on_write = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_unnamed_buffer_when_opening = true,
  hijack_directories = { enable = true, auto_open = true },
  -- update_to_buf_dir = { enable = true, auto_open = true, },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = custom_filters,
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 200,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    },
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
    },
  },
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- show_icons = {
  --   git = 1,
  --   folders = 1,
  --   files = 1,
  --   folder_arrows = 1,
  --   tree_width = 30,
  -- },
}
