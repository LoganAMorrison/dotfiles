-- In init.lua or filetype.nvim's config file
require("filetype").setup {
  overrides = {
    extensions = {
      wl = "mma",
      m = "mma",
      wls = "mma",
      mt = "mma",
      -- FeynRules
      fr = "mma",
      -- FeynArts
      mod = "mma",
      gen = "mma",
    },
  },
}
