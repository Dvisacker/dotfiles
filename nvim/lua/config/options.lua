-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set various options
vim.opt.history = 500
vim.opt.autoread = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 500

-- Set wildignore
vim.opt.wildignore:append({ "*.o", "*~", "*.pyc" })
if vim.fn.has("win16") == 1 or vim.fn.has("win32") == 1 then
  vim.opt.wildignore:append({ ".git\\*", ".hg\\*", ".svn\\*" })
else
  vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })
end

-- Disable backups and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Set GUI font (if applicable)
-- vim.opt.guifont = "font-hack-nerd-font:h11"
vim.opt.guifont = "Hack Nerd Font:h11,Apple Color Emoji:h11"
vim.g.have_nerd_font = true
