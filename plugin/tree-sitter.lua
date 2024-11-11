-- /plugin/tree-sitter.lua

-- load treesitter, lưu lại trạng thái vào biến `status`
local status, treesitter = pcall(require, 'nvim-treesitter.configs')

-- nếu `status` trả về false, ngừng, ko làm gì hết
if not status then return end

treesitter.setup {
    -- cài đặt 1 số định dạng file hay sử dụng
    -- bạn có thể tìm danh sách file ở đây
    -- repo: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    ensure_installed = {'lua', 'cpp', 'python'},

    -- các cài đặt bên dưới thì cứ để mặc định thôi là được
    highlight = {enable = true},
    indent = {enable = true},
    auto_install = false
}
