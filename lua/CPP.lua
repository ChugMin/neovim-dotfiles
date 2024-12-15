local M = {}

local Terminal = require("toggleterm.terminal").Terminal

-- Define the function to compile and run C++ code
function M.run_cpp()
    -- Build the command for Windows (generate .exe and run it)
    local cmd = "g++ -std=c++17 " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. ".exe && " .. vim.fn.expand("%:r") .. ".exe"
    -- Create a terminal instance with the command
    local term = Terminal:new({
        cmd = cmd,          -- Compile and run the C++ program
        direction = "float", -- Open terminal as a floating window
        close_on_exit = false -- Keep terminal open after execution
    })
    term:toggle()
end

return M
