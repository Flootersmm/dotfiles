---@type ChadrcConfig 
 local M = {}
 M.ui = { theme = 'chadracula' }
 M.plugins = "custom.plugins"
 M.mappings = require("custom.mappings")

vim.api.nvim_set_hl(0, "Comment", { fg = "#999999"})
vim.api.nvim_set_hl(0, "@comment", { link = "Comment"})

 return M
