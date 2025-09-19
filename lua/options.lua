-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et
if vim.fn.has 'win32' == 1 then
  vim.opt.shell = [["C:\Program Files\PowerShell\7\pwsh.exe"]]
  vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end
-- General
vim.opt.backup = false -- creates file backup
vim.opt.cmdheight = 2 -- makes command line bigger/easier to read
vim.opt.completeopt = { 'menuone', 'noselect' } -- Makes cmp less clunky
vim.opt.conceallevel = 0 -- Makes markdown backticks visible?
vim.opt.swapfile = false -- Disable swap files
vim.opt.undofile = true -- Enable persistent undo
vim.opt.writebackup = false -- Disable write backups
vim.opt.shortmess:append 'c' -- Avoid showing extra messages during completion
vim.opt.fileencoding = 'utf-8' -- Default file encoding

-- Tab Settings
vim.opt.tabstop = 3 -- Number of spaces for a tab
vim.opt.shiftwidth = 3 -- Spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Make indenting smarter
vim.opt.showtabline = 2

-- Appearance
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the terminal
vim.opt.numberwidth = 4 -- Set number column width
vim.opt.wrap = false -- Display lines as one long line
vim.opt.laststatus = 2 -- Always show the statusline

-- Search Settings
vim.opt.incsearch = true -- Show match as you type
vim.opt.hlsearch = true -- Highlight all matches of previous search

-- Autocommands
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vhdl',
  callback = function()
    vim.bo.fileencoding = 'ascii' -- Use ASCII encoding for VHDL files per SRC standards
  end,
})
