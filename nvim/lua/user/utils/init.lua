local utils = {}

utils.get_capabilites = function()
  return require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

---Add quotes to the string
utils.add_quotes = function(str)
  return "'" .. str .. "'"
end

utils.icons = require "user.utils.icons"

return utils
