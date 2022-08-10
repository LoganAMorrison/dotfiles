local CommentConfig = {}

CommentConfig.setup = function()
   local comment = require "Comment"
   local pre_hook = function(_ctx)
      return require("ts_context_commentstring.internal").calculate_commentstring()
   end

   comment.setup {
      padding = true,
      ignore = "^$",
      mappings = {
         ---operator-pending mapping
         ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
         basic = true,
         ---extended mapping
         ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
         extra = false,
      },
      toggler = {
         ---line-comment toggle
         line = "gcc",
         ---block-comment toggle
         block = "gbc",
      },
      opleader = {
         ---line-comment opfunc mapping
         line = "gc",
         ---block-comment opfunc mapping
         block = "gb",
      },
      pre_hook = pre_hook,
      post_hook = nil,
   }
end

return CommentConfig
