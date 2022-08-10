local set_theme = function(variation)
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  if variation == "macchiato" then
    vim.g.catppuccin_flavour = "macchiato"
  elseif variation == "latte" then
    vim.g.catppuccin_flavour = "latte"
  elseif variation == "frappe" then
    vim.g.catppuccin_flavour = "frappe"
  elseif variation == "mocha" then
    vim.g.catppuccin_flavour = "mocha"
  end

  catppuccin.setup {
    integrations = {
      lsp_trouble = true,
      lsp_saga = true,
      gitgutter = true,
      gitsigns = true,
      which_key = true,
      barbar = true,
      ts_rainbow = true,
    },
  }

  vim.cmd [[colorscheme catppuccin]]
end

return {
  use_macchiato = function()
    set_theme "macchiato"
  end,
  use_latte = function()
    set_theme "latte"
  end,
  use_frappe = function()
    set_theme "frappe"
  end,
  use_mocha = function()
    set_theme "mocha"
  end,
}
