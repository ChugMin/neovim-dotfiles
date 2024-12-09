-- /lua/map.lua
local cpp = require("CPP")

local keymap = vim.keymap
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- Toggle NeoTree sidebar
keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')

-- Moving around windows using s + h,j,k,l
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sl', '<C-w>l')

-- Split windows
keymap.set('n', 'ss', ':split<cr><C-w>w')
keymap.set('n', 'sv', ':vsplit<cr><C-w>w')

-- Next/Prev tab page
keymap.set('n', '<leader>n', ':BufferLineCycleNext<CR>')
keymap.set('n', '<leader>b', ':BufferLineCyclePrev<CR>')

-- Close all tabs
keymap.set('n', '<leader>ta', [[:tabedit<cr>:BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>]])
-- Keep current tab and close the others
keymap.set('n', '<leader>to', [[:BufferLineCloseLeft<cr>:BufferLineCloseRight<cr>]])

-- Save file
keymap.set('n', '<C-s>', ':w<cr>')
-- do somthing else

-- Move lines and group lines left, right
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

-- Move lines and group lines up, down
keymap.set('n', 'K', ':m .-2<cr>')
keymap.set('n', 'J', ':m .+1<cr>')

keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Find file in NvimTree
keymap.set('n', '@', ':NvimTreeFindFile<cr>')

-- Duplicate line
keymap.set('n', '<C-d>', 'yyp')

vim.api.nvim_set_keymap("n", "<F5>", ":cd %:p:h | w | !g++ -std=c++17 % -o %:r.exe && %:r.exe<CR>", { noremap = true, silent = true })

-- Switch tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Bind to a key (e.g., <Leader>l for layout)
vim.api.nvim_set_keymap('n', '<Leader>l', ':lua require("window_layouts").SetupCustomLayoutForCPP()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>re', ':lua require("window_layouts").RESIZE()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>to', ':tabonly | bufdo bd<CR>', { desc = 'Close current tab' })

-- Map keys for compile and run
vim.keymap.set("n", "<F6>", cpp.compile_and_run_cpp, { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", function()
    vim.cmd("write")
    vim.cmd("silent !cls")
    cpp.compile_and_run_cpp()
end, { noremap = true, silent = true })
