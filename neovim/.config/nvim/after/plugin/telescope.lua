-- Configuring Telescope Nvim Extension
local telescope = require("telescope");
local actions = require("telescope.actions");

-- Setup
telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    },
    -- For Deleting Buffers in Find Buffers Pane
    pickers = {
        buffers = {
            mappings = {
                i = { ["<C-x>"] = actions.delete_buffer, },
                n = { ["<c-x>"] = actions.delete_buffer, }
            }
        }
    }
}

-- Extensions
telescope.load_extension('fzf'); -- Telescope Fzf Native

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('ui-select');
