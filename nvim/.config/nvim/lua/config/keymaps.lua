-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ============================================================================
-- VSCode-style keybindings layered on top of LazyVim defaults.
--
-- Terminal caveats (these keys are sent by the *terminal emulator on your
-- laptop*, not by nvim):
--   * Ctrl+S works only with terminal flow-control disabled. Your .zshrc
--     already runs `stty -ixon`, so this is handled.
--   * Ctrl+/ is sent as Ctrl+_ (0x1f) by most terminals; modern ones
--     (kitty/wezterm/foot with the kitty keyboard protocol) send a real
--     <C-/>. Both are mapped below.
--   * Ctrl+` rarely reaches nvim over SSH. A fallback (<leader>ft) is noted.
-- ============================================================================

local map = vim.keymap.set

-- Save file (Ctrl+S) -- normal, insert, visual; returns to normal mode
map({ "n", "i", "v" }, "<C-s>", "<cmd>silent! write<cr><esc>", { desc = "Save file" })

-- Quick Open / find files (Ctrl+P) -- works whether LazyVim uses snacks or telescope
local function find_files()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.picker then
    snacks.picker.files()
  else
    require("telescope.builtin").find_files()
  end
end
map({ "n", "i" }, "<C-p>", function()
  -- leave insert mode first so the picker opens cleanly
  if vim.fn.mode():match("i") then
    vim.cmd("stopinsert")
  end
  find_files()
end, { desc = "Find files (Quick Open)" })

-- Command palette (Ctrl+Shift+P) -- same as <leader>sk: fuzzy-search all
-- keymaps and run the chosen one. NOTE: most terminals send the SAME bytes for
-- Ctrl+P and Ctrl+Shift+P, so this only reaches nvim in terminals that speak
-- the kitty keyboard protocol (kitty/wezterm/foot/ghostty). If it doesn't fire,
-- <leader>sk still works everywhere.
local function search_keymaps()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.picker then
    snacks.picker.keymaps()
  else
    require("telescope.builtin").keymaps()
  end
end
map({ "n", "i" }, "<C-S-p>", function()
  if vim.fn.mode():match("i") then
    vim.cmd("stopinsert")
  end
  search_keymaps()
end, { desc = "Command palette (search keymaps)" })

-- Toggle comment (Ctrl+/) -- uses Neovim's built-in gc operator.
-- remap=true so gcc/gc resolve to the comment mappings.
map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })

-- Toggle file explorer sidebar (Ctrl+B) -- VSCode's sidebar toggle
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- Toggle terminal (Ctrl+`) -- may not reach nvim in all terminals;
-- LazyVim's <leader>ft / <leader>fT also open a terminal.
map("n", "<C-`>", function()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.terminal then
    snacks.terminal()
  else
    vim.cmd("terminal")
  end
end, { desc = "Toggle terminal" })
