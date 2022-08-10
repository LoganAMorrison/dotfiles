local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end
local configs_status_ok, configs = pcall(require, "lspconfig.configs")
if not configs_status_ok then
  return
end

local LspWls = {}
local custom_attach = function(client)
  print "Deluge LSP started."
end

LspWls.setup = function()
  local bin_name = "wolfram"
  local cmd = { bin_name, "-script", "/home/logan/github/lsp-wl/init.wls", "--tcp-server=6536" }

  if not configs.lsp_wl then
    configs.lsp_wl = {
      default_config = {
        cmd = cmd,
        filetypes = { "mma" },
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        settings = {
          ["lsp-wl"] = {
            --- Whether enable wolfram language lsp.
            enable = true,
            --- Port to communicate with language server.
            port = 6536,
            trace = {
              --- Traces the communication between vim and the wolfram language server.
              --- Options: "off", "messages" or "verbose".
              server = "off",
            },
            --- Path to wolfram executable.
            wolframExecutablePath = "wolfram",
            --- Path to wolfram language server directory.
            wolframLanguageServerPath = "/home/logan/github/lsp-wl/init.wls",
            --- Controls the maximum number of problems produced by the server.
            maxNumberOfProblems = 100,
          },
        },
      },
      docs = {
        description = [[
https://github.com/kenkangxgwe/lsp-wl

Wolfram Language Server (WLServer) is an implementation of the Microsoft's Language Server Protocol (LSP)
for Wolfram Language. This server is implemented in Wolfram Language itself.
]],
      },
    }
  end

  lspconfig.lsp_wl.setup {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = custom_attach,
  }
end

return LspWls
