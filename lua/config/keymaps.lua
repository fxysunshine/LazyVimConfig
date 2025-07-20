-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-p>", "<cmd>Files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<C-f>", "<cmd>Rg<CR>", { desc = "Search text" })

vim.keymap.set("n", "f", "<Plug>(easymotion-f)")
vim.keymap.set("n", "F", "<Plug>(easymotion-bd-f)")

vim.keymap.set("n", " f", "<cmd>Mru<CR>")

vim.keymap.set("n", "gd", function()
  vim.cmd("normal! m'") -- 保存位置标记
  vim.lsp.buf.definition()
  vim.cmd("normal! zz") -- 跳转后强制居中，无平滑
end, { desc = "Go to definition (no smooth scroll)" })
