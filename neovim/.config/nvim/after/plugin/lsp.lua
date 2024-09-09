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
                environment = {
                    -- inlcudePaths = {},
                    -- documentRoot = {},
                    phpVersion = "7.2.34"
                },
                format = {
                    braces = "k&r"
                },
                -- Writing Whole Stubs as configure() function Overrides default values :(
                -- Need to Add Stub for Flawless Integration of Intelephense in Plugin Folder
                stubs = {
                    "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
                    "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp",
                    "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml",
                    "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO",
                    "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix",
                    "pspell", "random", "readline", "Reflection", "session", "shmop", "SimpleXML",
                    "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals",
                    "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader",
                    "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
                    -- Custom Stub
                    "/var/www/html/ps/Sites/frostmag.com/", -- For ArbPlugin
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
