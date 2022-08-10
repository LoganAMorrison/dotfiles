-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand "$USER"

local config_dir = "/home/" .. USER .. "/.config/nvim"
local sumneko_root_path = config_dir .. "/lua-language-server"
local sumneko_binary = config_dir .. "/lua-language-server/bin/lua-language-server"

local lspconfig_loaded, lspconfig = pcall(require, "lspconfig")
if not lspconfig_loaded then
  return
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
table.insert(runtime_path, config_dir .. "lua/?.lua")
table.insert(runtime_path, config_dir .. "lua/user/?.lua")

local sumneko_lua_config = {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = { [vim.fn.expand "$VIMRUNTIME/lua"] = true, [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.sumneko_lua.setup(sumneko_lua_config)

-- local luadev_loaded, luadev = pcall(require, "lua-dev")
-- if not luadev_loaded then
--   return
-- end

-- luadev.setup {
--   library = {
--     vimruntime = true, -- runtime path
--     types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
--     plugins = true, -- installed opt or start plugins in packpath
--     -- you can also specify the list of plugins to make available as a workspace library
--     -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
--   },
--   runtime_path = false, -- enable this to get completion in require strings. Slow!
--   -- pass any additional options that will be merged in the final lsp config
--   lspconfig = sumneko_lua_config,
-- }

-- lspconfig.sumneko_lua.setup(luadev)
