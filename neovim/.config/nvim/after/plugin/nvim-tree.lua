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

local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.toggle({ focus = false });
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
