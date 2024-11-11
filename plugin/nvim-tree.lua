-- /plugin/nvim-tree.lua

local status, nvimtree = pcall(require, 'nvim-tree')
if not status then return end


local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

 
  -- Ấn `Ctrl + ]` để thay đổi thư mục root
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))

  -- Ấn `Enter` để edit 
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))

  -- Ấn `a` để tạo file
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    -- Copy file or folder
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    -- Delete file or folders
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))

  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))

  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))

end

nvimtree.setup({
    on_attach = on_attach,
})


