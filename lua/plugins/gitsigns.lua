return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- GitLens-style inline blame on the current line
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- end of line
      delay = 300,
      ignore_whitespace = true,
    },
    current_line_blame_formatter = "  <author>, <author_time:%R> • <summary>",
  },
  keys = {
    -- toggle the inline blame on/off (LazyVim already has <leader>ghb for full blame float)
    { "<leader>uB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Inline Git Blame" },
  },
}
