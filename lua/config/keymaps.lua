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

-- 1. Enable "All Modes" for the mouse (most commonly used, suitable for mouse-assisted operations)
vim.keymap.set('n', '<leader>mo', function()
  vim.o.mouse = 'a'
  print('✅ The mouse is enabled in [all modes](Normal/Visual/Insert/Command Line)')
end, { desc = 'Mouse: enabled in all modes' })

-- 2. Disable the mouse (completely, suitable for keyboard-only operation)
vim.keymap.set('n', '<leader>mf', function()
  vim.o.mouse = ''
  print('❌ The mouse is [disabled] (Keyboard-only mode) ')
end, { desc = 'Mouse: Disabled' })

-- 3. Turn on mouse "Normal + Visual Mode" (use mouse only for navigation and text selection)
vim.keymap.set('n', '<leader>mn', function()
  vim.o.mouse = 'nv'
  print('🔧 The mouse is enabled in [Normal + Visual Mode] (for navigation/text selection)')
end, { desc = 'Mouse: enabled Normal + Visual Mode'})

-- 4. Turn on mouse "Insert Mode" (use mouse to position cursor when entering text only)
vim.keymap.set('n', '<leader>mi', function()
  vim.o.mouse = 'i'
  print('📝 The mouse is in [Insert Mode] (cursor positioning only when typing)')
end, { desc = 'Mouse: enabled in insert mode' })
