vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
vim.g.vimtex_view_general_options_latexmk = "--unique"

vim.cmd [[let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}]]
vim.cmd [[set spelllang=en_gb]]

return {
  -- Turn of formatting from latexindent and let null-ls do it
  --on_attach = function(client)
  --   client.resolved_capabilities.document_formatting = false
  -- end,

  build = {
    executable = "latexmk",
    args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
    onSave = false,
  },
  auxDirectory = ".",
  forwardSearch = {
    executable = nil,
    args = nil,
  },
  chktex = {
    onOpenAndSave = false,
    onEdit = false,
  },
  diagnosticsDelay = 300,
  formatterLineLength = 80,
  bibtexFormatter = "latexindent",
  latexFormatter = "latexindent",
  latexindent = {
    ["local"] = nil,
    modifyLineBreaks = false,
  },
}
