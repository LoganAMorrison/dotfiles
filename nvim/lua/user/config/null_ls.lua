local NullLs = {}

NullLs.setup = function()
   local null_ls = require "null-ls"

   null_ls.register {
      sources = {
         -- Formatting
         null_ls.builtins.formatting.stylua,
         null_ls.builtins.formatting.clang_format,
         null_ls.builtins.formatting.black,
         null_ls.builtins.formatting.cmake_format,
         null_ls.builtins.formatting.fish_indent,
         null_ls.builtins.formatting.fprettify,
         null_ls.builtins.formatting.latexindent,
         null_ls.builtins.formatting.prettier,
         null_ls.builtins.formatting.rustfmt,
         null_ls.builtins.formatting.shfmt,
         null_ls.builtins.formatting.taplo,
         -- Diagnostics
         null_ls.builtins.diagnostics.mypy,
         null_ls.builtins.diagnostics.flake8,
         -- null_ls.builtins.diagnostics.chktex,
         null_ls.builtins.diagnostics.luacheck,
         null_ls.builtins.diagnostics.shellcheck,
         -- Code Actions
         null_ls.builtins.code_actions.shellcheck,
         null_ls.builtins.code_actions.gitsigns,
      },
   }

   null_ls.setup {
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return NullLs
