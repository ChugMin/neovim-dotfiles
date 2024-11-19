local M = {}

M.SetupCustomLayoutForCPP = function()
  -- Split the window horizontally
  vim.cmd('vsplit')

  -- Move to the right window (now it exists)
  vim.cmd('wincmd l')

  -- Adjust the window sizes
  vim.cmd('vertical resize 40') -- Set width for the right window

  vim.cmd('split')
  
  vim.cmd('resize 15')
end

M.RESIZE = function()
  vim.cmd('wincmd h')
  vim.cmd('vertical resize 92')
end

return M
