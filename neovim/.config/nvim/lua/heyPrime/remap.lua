local keymap = vim.keymap;
local cmd = vim.cmd;

-- :Explore Mode which Bring Directory Structure
-- Obsolete as Using Nvim Tree
-- keymap.set("n", "<leader>file", cmd.Explore);

-- :Move    For Moving Lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- For Moving Between Windows
-- TODO: Remove this as CTRL + W is Easier
keymap.set("n", "<leader>ma", "<C-w>h")
keymap.set("n", "<leader>md", "<C-w>j")
keymap.set("n", "<leader>ms", "<C-w>k")
keymap.set("n", "<leader>mf", "<C-w>l")

-- For Indenting and Staying in Indent Mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- For Resizing Windows with Arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")

-- Page Jumping
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Search Term To Stay In Middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- For Pasting i.e Replacing without picking deleted text
keymap.set("x", "<leader>p", [["_dP]])

-- For Copying to System ClipBoard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- For Deleting & Copying to System Registers
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- For Quiting All Buffers with Saving
keymap.set("n", "<leader>zz", "<cmd>:wqa<CR>");
-- For Quiting All Buffers without Saving
keymap.set("n", "<leader>zq", "<cmd>:qa!<CR>");

-- Format Code
keymap.set("n", "<leader>fc", vim.lsp.buf.format, { desc = "[F]ormat[C]ode" });
-- TODO: Check Formatting for Biome
-- keymap.set("n", "<leader>fcr", "<cmd>:%!rome format --stdin-file-path %<CR>", { desc = "[F]ormat[C]odeWith[R]ome" });

-- For Killing Buffer You are On Currently
keymap.set("n", "<leader>x", "<cmd>:bd<CR>");
-- For Switching Buffers Quickly
keymap.set("n", "<leader>pb", "<cmd>:bp<CR>");
keymap.set("n", "<leader>nb", "<cmd>:bN<CR>");

-- QuickFix Mappings For Fixing Errors
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Binding for Opening New Project in New Tmux Window
keymap.set(
    "n",
    "<leader>op",
    "<cmd>silent !tmux neww \"" ..
    "nvim '$(fd --type d --type l --hidden --search-path $HOME --color=never . | fzf-tmux)'" ..
    "\"<CR>",
    { desc = "[O]pen [P]roject" }
)

-- Instant Replace the Word You are On by ThePrimeagen
keymap.set(
    "n",
    "<leader>srf",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[S]tring[R]e[F]actor" }
)

-- Make the Bash Script Executable
keymap.set("n", "<leader>exe", "<cmd>!chmod +x %<CR>", { silent = true })

-- Instanly Edit the Packer.lua File for Managing Plugins/Extensions
keymap.set("n", "<leader>plug", "<cmd>e ~/.config/nvim/lua/heyPrime/packer.lua<CR>");

-- View this Remap File Instanly
keymap.set("n", "<leader>remap", "<cmd>e ~/.config/nvim/lua/heyPrime/remap.lua<CR>");


-- Other Mappings From Plugins -------------

-- AutoPairs
-- <A-p> or Alt+p = Insert Paranthesis on Line
-- Will Add Type of Paranthesis which have missing end.
-- It's Handled by LSP.


-- Commentary
-- <leader>cl = [C]omment [L]ine : For Commenting a Line
-- <leader>cb = [C]omment [B]lock : For Commenting a Code Block
-- NOTE: cb cab be changed to a key combo for supporting Vim Motions


-- Fugitive
-- Viewing Git Status
keymap.set("n", "<leader>gs", cmd.Git);


-- GitSigns
-- For Jumping to Next Hunk
keymap.set("n", "<leader>gnh", "<cmd>:Gitsigns next_hunk<CR>", { desc = "[G]it[N]ext[H]unk" });
-- For Jumping to Previous Hunk
keymap.set("n", "<leader>gph", "<cmd>:Gitsigns prev_hunk<CR>", { desc = "[G]it[P]revious[H]unk" });
-- For Previewing Hunk
keymap.set("n", "<leader>gvh", "<cmd>:Gitsigns preview_hunk<CR>", { desc = "[G]it[V]iew[H]unk" });
-- For Highlighting Lines
keymap.set("n", "<leader>ghl", "<cmd>:Gitsigns toggle_linehl<CR>", { desc = "[G]it[H]ighlight[L]ine" });
-- For Highlighting Words
keymap.set("n", "<leader>ghw", "<cmd>:Gitsigns toggle_word_diff<CR>", { desc = "[G]it[H]ighlight[W]ords" });


-- LSP = Language Server Protocol
-- Using Lsp-Zero.nvim Plugin which has default KeyBindings
-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
-- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
-- <Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().


-- Nvim Tree
-- Toggling NvimTree/DirectoryStructure
keymap.set("n", "<leader>dir", "<cmd>:NvimTreeToggle<CR>");
-- Other Mappings are Realted to Directory Structure


-- Telescope
local builtin = require('telescope.builtin');
-- For Finding Files in Directory
keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' });
-- For Finding Files in Git Repo
-- Kept as <C-p> or Ctrl+p Instead of <leader>fg for Universality lol
keymap.set('n', '<C-p>', builtin.git_files, {});
-- For Finding String in Files of Directory
keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[F]ind [S]tring' });
-- For Finding Currently Opened Buffers
keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffer' });
-- For Fuzzy Finding Help Topics
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' });
-- <C-x> or Ctrl+x = For Killing Buffers while Fuzzy Finding Buffers
-- Other Default KeyMaps for Navigating while in Fuzzy Find Mode.

-- TreeSitter

-- Theme
-- Adding ReMap For Quickly Sourcing theme.lua File to Change Theme
keymap.set(
    "n",
    "<leader>theme",
    "<cmd>:so $HOME/.config/nvim/after/plugin/theme.lua<CR>",
    { desc = "[THEME], Source Theme File" }
);

-- UndoTree
-- Toggling UndoTree
keymap.set("n", "<leader>ut", cmd.UndotreeToggle, { desc = "[U]ndo[T]ree" });


-- Remap For Cargo
keymap.set("n", "<leader>rb", "<cmd>!cargo build<CR>", { desc = "[R]ust[B]uild" });
keymap.set("n", "<leader>rr", "<cmd>!cargo run<CR>", { desc = "[R]ust[R]un" });
