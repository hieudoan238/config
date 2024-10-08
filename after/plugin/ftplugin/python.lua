vim.api.nvim_create_autocmd("FileType", {
  desc = "python ft mappings",
  group = vim.api.nvim_create_augroup("py_mapping", { clear = true }),
  pattern = "python",
  callback = function(opts)
      vim.keymap.set("n", "<Space>run", ":w! <bar> exec '!python3 '.shellescape('%')<CR>")
  end
})
