local lsp_installer_servers = require "nvim-lsp-installer.servers"

local server_available, requested_server = lsp_installer_servers.get_server "clangd"
local opts
if not server_available then
   return {}
else
   opts = requested_server:get_default_options()
end

opts.cmd = {
   opts.cmd[1],
   "--all-scopes-completion",
   "--suggest-missing-includes",
   "--background-index",
   "--pch-storage=disk",
   "--cross-file-rename",
   "--log=info",
   "--completion-style=detailed",
   "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
   "--clang-tidy",
   -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
   -- "--fallback-style=Google",
   -- "--header-insertion=never",
   -- "--query-driver=<list-of-white-listed-complers>"
}

-- opts.on_attach = function(client)
--   client.resolved_capabilities.document_formatting = false
-- end

return opts
