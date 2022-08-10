local WhichKeyLsp = {
   name = "LSP",
   a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
   d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
   },
   w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
   },
   f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
   i = { "<cmd>LspInfo<cr>", "Info" },
   I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
   j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Next Diagnostic",
   },
   k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Prev Diagnostic",
   },
   l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
   p = {
      name = "Peek",
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
   },
   q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
   r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
   s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
   S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
   },
}

return WhichKeyLsp
