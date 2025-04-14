-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save file
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save File' })

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Selecionar tudo' })

-- Remove search highlights after searching
vim.keymap.set(
  'n',
  '<Esc>',
  '<cmd>nohlsearch<CR>',
  { desc = 'Remove search highlights' }
)

-- Exit Vim's terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set(
  'n',
  '<C-h>',
  ':wincmd h<cr>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  ':wincmd l<cr>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  ':wincmd j<cr>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  ':wincmd k<cr>',
  { desc = 'Move focus to the upper window' }
)

vim.keymap.set('n', '<leader>tc', ':tabnew<cr>', { desc = '[T]ab [C]reat New' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab Close' })
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>', { desc = '[T]ab [N]ext' })
vim.keymap.set(
  'n',
  '<leader>tp',
  ':tabprevious<cr>',
  { desc = '[T]ab [P]revious' }
)

-- Easily split windows
vim.keymap.set(
  'n',
  '<leader>wv',
  ':vsplit<cr>',
  { desc = '[W]indow Split [V]ertical' }
)
vim.keymap.set(
  'n',
  '<leader>wh',
  ':split<cr>',
  { desc = '[W]indow Split [H]orizontal' }
)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left in visual mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right in visual mode' })

local function close_all_folds()
  vim.api.nvim_exec2('%foldc!', { output = false })
end

local function open_all_folds()
  vim.api.nvim_exec2('%foldo!', { output = false })
end

-- Fold
vim.keymap.set(
  'n',
  '<leader>zs',
  close_all_folds,
  { desc = '[s]hut all folds' }
)
vim.keymap.set('n', '<leader>zO', open_all_folds, { desc = '[O]pen all folds' })
vim.keymap.set('n', '<leader>z', 'za', { desc = 'Toggle fold under cursor' })

-- Line movement
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set(
  'v',
  '<A-k>',
  ":m '<-2<CR>gv=gv",
  { desc = 'Move selected lines up' }
)
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set(
  'v',
  '<A-j>',
  ":m '>+1<CR>gv=gv",
  { desc = 'Move selected lines down' }
)

-- Identation
vim.keymap.set('n', '<A-l>', '>>', { desc = 'Indent line right' })
vim.keymap.set('v', '<A-l>', '>gv', { desc = 'Indent selection right' })
vim.keymap.set('n', '<A-h>', '<<', { desc = 'Indent line left' })
vim.keymap.set('v', '<A-h>', '<gv', { desc = 'Indent selection left' })

-- Buffer
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer [N]ext' })
vim.keymap.set(
  'n',
  '<leader>bp',
  ':bprevious<CR>',
  { desc = '[B]uffer [P]revious' }
)
vim.keymap.set(
  'n',
  '<leader>bd',
  ':bdelete<CR>',
  { desc = '[B]uffer [D]elete' }
)
vim.keymap.set(
  'n',
  '<leader>bD',
  ':bdelete!<CR>',
  { desc = '[B]uffer Force [D]elete' }
)
vim.keymap.set(
  'n',
  '<leader>bo',
  ':Bdelete! %<CR>',
  { desc = '[B]uffer delete [O]thers' }
)
vim.keymap.set(
  'n',
  '<Tab>',
  ':BufferLineCycleNext<CR>',
  { desc = 'Next buffer' }
)
vim.keymap.set(
  'n',
  '<S-Tab>',
  ':BufferLineCyclePrev<CR>',
  { desc = 'Previous buffer' }
)
