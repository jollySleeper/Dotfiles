require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "v", action = "vsplit" },
            },
        },
    },
});

-- To View All The Active Nvim-Tree Mappings On The Fly
-- vim.pretty_print(require('nvim-tree.api').config.mappings.active());
