-- /lua/plugins.lua

-- Lưu lại đường dẫn tới file lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Nếu đường dẫn trên ko tồn tại, thì dùng Git clone nó về
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local theme = require('theme')

require("lazy").setup({
    theme,
	{
    	'nvim-treesitter/nvim-treesitter',
    	build = ':TSUpdate',
  	},
	{
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            }
        }
    },
	{
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            -- đây là plugin bổ sung thêm để hỗ trợ chức năng của telescope
            'nvim-lua/plenary.nvim'
        }
    },
	{
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            -- plugin này hỗ trợ nvim-tree hiển thị icon 
            -- tương ứng với từng loại file
            "nvim-tree/nvim-web-devicons"
        }
    },
	{
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "goolord/alpha-nvim",
        lazy = true,
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },    
	{
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
            
            {"onsails/lspkind.nvim"},
        }
    },
	{
        "windwp/nvim-autopairs"
    },

	{'akinsho/toggleterm.nvim', version = "*", config = true},

    {
        "Pocco81/auto-save.nvim",
        config = function()
          require("auto-save").setup({
            enabled = true, -- Auto-save is enabled by default
            execution_message = {
              message = function() return "" end, -- Disable save messages
            },
            trigger_events = { "InsertLeave", "TextChanged" }, -- Save on insert leave or text change
          })
        end,
    },
      

	{
	  'numToStr/Comment.nvim',
	  config = function()
		require('Comment').setup()
	  end
    }

})
