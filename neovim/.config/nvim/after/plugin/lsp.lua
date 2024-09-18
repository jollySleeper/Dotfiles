-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- vim.pretty_print(lsp);
local custom_conf = {
    -- Configuring PHP Intelephense
    ["intelephense"] = {
        on_attach = function(client, bufnr)
            print('Hello Intelephense');
        end,
        settings = {
            intelephense = {
                format = {
                    braces = "k&r"
                }
            }
        }
    },
    -- Configuring Lua Server
    ["lua_ls"] = {
        -- Fix Undefined global 'vim' in Lua Files
        on_attach = function(client, bufnr)
            print('Hello Lua Language Server');
        end,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim"
                    },
                    unusedLocalExclude = {
                        "bufnr", "client"
                    }
                }
            }
        }
    },
    ["rust_analyzer"] = {
        on_attach = function(client, bufnr)
            print('Hello Rust');
        end,
    },
    ["biome"] = {
        on_attach = function(client, bufnr)
            print('Hello Biome');
        end,
    },
    ["clangd"] = {
        on_attach = function(client, bufnr)
            print('Hello ClangD');
        end,
    },
    ["jdtls"] = {
        on_attach = function(client, bufnr)
            print('Hello jdtls');
        end,
    },
    ["ruff"] = {
        on_attach = function(client, bufnr)
            print('Hello Ruff');
        end,
    }
};


local function lsp_configure(list)
    for server_name, opts in pairs(list) do
        lsp.configure(server_name, opts);
    end
end

lsp_configure(custom_conf);

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['ruff'] = { 'python' },
        ['jdtls'] = { 'java' }
    }
})

lsp.setup();

-- Setting Diagnostics as they don't work by default for me :(
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
});

-- Fidget Extension
require('fidget').setup();
