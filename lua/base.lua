-- Trong neovim, kí tự \ mặc định được gọi là <leader>
-- tuy nhiên, vì nó quá xa để nhấn, nên ae dev hay đổi kí tự này
-- sang kí tự <space> để gần hơn
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Thay đổi encoding mặc định của file thành utf-8
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Hiển thị số dòng trong file
vim.opt.nu = true
vim.opt.rnu = true

-- Cài đặt thụt dòng mặc định là 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Thụt dòng tự động khi ấn enter
vim.opt.ai = true
vim.opt.si = true

-- Tự động xuống dòng nếu kí tự trên dòng đó quá dài
vim.opt.wrap = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Giảm thời gian thực thi lệnh xuống 250ms
-- mặc định là 500ms
vim.opt.timeoutlen = 250
vim.opt.timeout = true
vim.opt.updatetime = 250

-- Khi tìm kiếm, không phân biệt chữ hoa, chữ thường
-- Ex: name NaME namE
vim.o.ignorecase = true
vim.o.smartcase = true

