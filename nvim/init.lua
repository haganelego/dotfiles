-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- cursor
vim.opt.guicursor = "n-i:ver25"
-- vim.opt.whichwrap:append({ "h", "l", "<", ">" })
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
