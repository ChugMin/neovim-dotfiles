-- /lua/theme.lua

-- Lua cho phép bạn return mà 
-- không cần đặt bên trong 1 function hay class nào cả
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- sử dụng lệnh `colorscheme` để load theme theo tên
        -- nếu bạn muốn load theme khác thì truy cập vào repo gốc nhé
        -- repo gốc: https://github.com/folke/tokyonight.nvim#-usage
        vim.cmd([[colorscheme tokyonight-storm]])
    end,
}
