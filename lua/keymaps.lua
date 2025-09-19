-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.g.mapleader = ' ' -- Space is the leader key

-- Default options for key mappings
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Helper function for setting keymaps
local function map(mode, lhs, rhs, options)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options or opts)
end
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal mode mappings
map('n', '<C-s>', ':w<CR>', opts) -- Save with <Ctrl-s>
--map("n", "<leader>q", ":q<CR>", opts)  -- Quit with <leader>q

-- Auto-center after jumping up or down
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize windows with arrows
map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)

-- Insert mode: Press jk to exit insert mode
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)

-- Visual mode mappings
map('v', '<', '<gv', opts) -- Stay in indent mode
map('v', '>', '>gv', opts) -- Stay in indent mode

-- Move text up and down in visual mode
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)
map('v', 'p', '"_dP', opts) -- Prevent overwrite of pasted content

-- Visual Block mode: Move text up and down
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Terminal mode mappings: Better terminal navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

-- Normal mode: toggle comment on current line
vim.keymap.set('n', '<C-_>', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment' })

-- Visual mode: toggle comment on selection
vim.keymap.set('v', '<C-_>', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment' })

vim.keymap.set('n', '<leader>e', function()
  local file = vim.fn.expand '%:p' -- full path of current buffer
  local dir = vim.fn.expand '%:p:h' -- directory of current buffer

  if vim.fn.filereadable(file) == 1 then
    -- buffer is a saved file, open Neo-tree at its directory and reveal it
    require('neo-tree.command').execute {
      toggle = true,
      dir = dir,
      reveal = true,
    }
  else
    -- fallback: just toggle Neo-tree at current working directory
    require('neo-tree.command').execute { toggle = true }
  end
end, { desc = 'Toggle Neo-tree at current file' })

-- vim: ts=2 sts=2 sw=2 et
