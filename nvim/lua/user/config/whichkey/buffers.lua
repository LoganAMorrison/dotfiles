local WhichKeyBuffers = {
   name = "Buffers",
   j = { "<cmd>BufferPick<cr>", "Jump" },
   f = { "<cmd>Telescope buffers<cr>", "Find" },
   b = { "<cmd>b#<cr>", "Previous" },
   w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
   e = {
      "<cmd>BufferCloseAllButCurrent<cr>",
      "Close all but current",
   },
   h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
   l = {
      "<cmd>BufferCloseBuffersRight<cr>",
      "Close all to the right",
   },
   D = {
      "<cmd>BufferOrderByDirectory<cr>",
      "Sort by directory",
   },
   L = {
      "<cmd>BufferOrderByLanguage<cr>",
      "Sort by language",
   },
}

return WhichKeyBuffers
