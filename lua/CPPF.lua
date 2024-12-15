-- Set C++ filetype for *.cpp files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.cpp",
    callback = function()
        vim.bo.filetype = "cpp"
    end,
})

-- Function to compile and run a C++ file
local function compile_and_run_cpp()
    local file_name = vim.fn.expand("%")
    if file_name:match("%.cpp$") then
        local exe_name = file_name:gsub("%.cpp$", ".exe")
        local compile_cmd = string.format("g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o \"%s\" \"%s\"", exe_name, file_name)

        -- Write file and compile
        vim.cmd("write")
        local compile_result = vim.fn.system(compile_cmd)

        if vim.v.shell_error == 0 then
            -- Run the compiled executable in a new terminal
            local run_cmd = string.format("start cmd /c \"%s && pause\"", exe_name)
            vim.fn.system(run_cmd)
        else
            -- Show compilation errors
            vim.api.nvim_err_writeln("Compilation failed:\n" .. compile_result)
        end
    else
        vim.api.nvim_err_writeln("Not a C++ file")
    end
end

-- Return the function to be used in other files
return {
    compile_and_run_cpp = compile_and_run_cpp
}