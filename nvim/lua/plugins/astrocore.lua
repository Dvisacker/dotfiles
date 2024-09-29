-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        mapleader = " ", -- Set leader key
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Split window
        ["ss"] = { ":split<CR><C-w>w", desc = "Split window horizontally" },
        ["sv"] = { ":vsplit<CR><C-w>w", desc = "Split window vertically" },

        -- Move between windows
        ["<space>"] = { "<c-w>w", desc = "Move to next window" },
        ["sh"] = { "<c-w>h", desc = "Move to left window" },
        ["sk"] = { "<c-w>k", desc = "Move to upper window" },
        ["sj"] = { "<c-w>j", desc = "Move to lower window" },
        ["sl"] = { "<c-w>l", desc = "Move to right window" },

        -- Custom movement
        ["J"] = { "5j", desc = "Move 5 lines down" },
        ["K"] = { "5k", desc = "Move 5 lines up" },
        ["vA"] = { "ggVG", desc = "Select all text" },
        ["B"] = { "^", desc = "Move to first non-blank character" },
        ["E"] = { "$", desc = "Move to end of line" },

        -- FZF mappings
        ["<leader>p"] = { ":FZF<CR>", desc = "Open FZF" },

        -- Resize windows
        ["<leader>="] = { function() vim.wo.winheight = vim.wo.winheight * 3/2 end, desc = "Increase window height" },
        ["<leader>-"] = { function() vim.wo.winheight = vim.wo.winheight * 2/3 end, desc = "Decrease window height" },

        -- Execute current line in shell
        ["<leader><Enter>"] = { "!!zsh<CR>", desc = "Execute current line in shell" },

        -- Move between windows with control-j,k,h,l
        ["<C-j>"] = { "<C-W>j", desc = "Move to lower window" },
        ["<C-k>"] = { "<C-W>k", desc = "Move to upper window" },
        ["<C-h>"] = { "<C-W>h", desc = "Move to left window" },
        ["<C-l>"] = { "<C-W>l", desc = "Move to right window" },

        -- Tab operations
        ["<C-t>"] = { ":tabnew<cr>", desc = "New tab" },
        ["<C-x>"] = { ":tabclose<cr>", desc = "Close tab" },

        -- Buffer navigation
        ["<tab>"] = { ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", desc = "Next buffer" },
        ["<s-tab>"] = { ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>", desc = "Previous buffer" },

        -- Keep search results at the center of screen
        ["n"] = { "nzz", desc = "Next search result (centered)" },
        ["N"] = { "Nzz", desc = "Previous search result (centered)" },
        ["*"] = { "*zz", desc = "Search word under cursor (centered)" },
        ["#"] = { "#zz", desc = "Search word under cursor backwards (centered)" },
        ["g*"] = { "g*zz", desc = "Search word under cursor (no boundaries, centered)" },
        ["g#"] = { "g#zz", desc = "Search word under cursor backwards (no boundaries, centered)" },
      },
      i = {
        -- Escape mappings
        ["kj"] = { "<ESC>", desc = "Escape insert mode" },
        ["jk"] = { "<ESC>", desc = "Escape insert mode" },
        ["<ESC>"] = false, -- Disable ESC in insert mode

        -- FZF completion in insert mode
        ["<c-x><c-k>"] = { "<plug>(fzf-complete-word)", desc = "FZF complete word" },
        ["<c-x><c-f>"] = { "<plug>(fzf-complete-path)", desc = "FZF complete path" },
        ["<c-x><c-l>"] = { "<plug>(fzf-complete-line)", desc = "FZF complete line" },
      },
      v = {
        -- Clipboard operations
        ["<Leader>a"] = { '"ay', desc = "Yank to register a" },
        ["<Leader>A"] = { '"Ay', desc = "Append yank to register A" },

        -- Search for visually selected text
        ["//"] = { 'y/\\V<C-R>=escape(@", \'/\\\')<CR><CR>', desc = "Search for selected text" },

        -- Execute visually selected text in shell
        ["<C-s>"] = { 'y:! <C-r>0<Home><right>', desc = "Execute selected text in shell" },
      },
      t = {
        -- Terminal mappings
        ["<C-h>"] = { "<C-\\><C-n><C-w>h", desc = "Move to left window from terminal" },
        ["<C-j>"] = { "<C-\\><C-n><C-w>j", desc = "Move to lower window from terminal" },
        ["<C-k>"] = { "<C-\\><C-n><C-w>k", desc = "Move to upper window from terminal" },
        ["<C-l>"] = { "<C-\\><C-n><C-w>l", desc = "Move to right window from terminal" },
        ["kj"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
        ["jk"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
      },
    },
  },
}
