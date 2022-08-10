local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    -- Formatting
    formatting.clang_format,
    formatting.cmake_format,
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.latexindent,
    formatting.stylua,
    formatting.fish_indent,
    formatting.fprettify,
    formatting.latexindent,
    formatting.prettier,
    formatting.rustfmt,
    formatting.shfmt,
    formatting.taplo,
    formatting.fourmolu,

    -- Diagnostics
    -- diagnostics.mypy,
    diagnostics.flake8,
    -- diagnostics.pylint,
    -- diagnostics.pydocstyle,
    -- diagnostics.luacheck,
    -- diagnostics.salene,
    diagnostics.shellcheck,
    -- diagnostics.chktex,
    diagnostics.yamllint,
    -- diagnostics.stylelint,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    end
  end,
}
