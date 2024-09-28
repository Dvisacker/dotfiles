-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Auto commands
-- vim.cmd([[
--   augroup TerminalSettings
--     autocmd!
--     autocmd BufWinEnter,WinEnter term://* startinsert
--     autocmd BufLeave term://* stopinsert
--   augroup END
-- ]])
--
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- -- Disable the default 'K' mapping and set a new one if desired
-- vim.api.nvim_create_autocmd("User", {
--   group = augroup("remove_k_mapping"),
--   pattern = "VeryLazy",
--   callback = function()
--     -- Remove the default 'K' mapping
--     -- vim.keymap.del("n", "K")
--
--     -- Optionally, set a new mapping for 'K'
--     vim.keymap.set("n", "K", "5k", { desc = "Custom K action" })
--
--     -- Or, if you want to keep the LSP hover functionality but on a different key:
--     vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Hover Documentation" })
--   end,
-- })