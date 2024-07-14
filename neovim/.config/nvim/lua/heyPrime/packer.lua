-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]];

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim');

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    });

    -- Telescope Extension
    -- Fzf Searcher
    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    });
    -- Telescope UI Selector
    use('nvim-telescope/telescope-ui-select.nvim');

    -- TreeSitter
    use({
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.2',
        run = ':TSUpdate'
    });

    -- UndoTree
    use('mbbill/undotree');

    -- Fugitive : Git in Vim
    use('tpope/vim-fugitive');

    -- LSP-Zero
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    });

    -- Commentary
    use('terrortylor/nvim-comment');

    -- Github Theme
    use({
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7'
    });

    -- Tree Directory Viewer
    use({
        'nvim-tree/nvim-tree.lua',
        tag = 'v1.3',
        requires = { 'nvim-tree/nvim-web-devicons' }
    });

    -- GitSigns
    use({
        'lewis6991/gitsigns.nvim',
        tag = 'v0.9.0',
    });

    -- AutoPairs
    use('windwp/nvim-autopairs');

    -- Lua Line
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    });
end);
