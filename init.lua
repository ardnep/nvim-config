-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.relativenumber = true

local enable_providers = {
  "python3_provider",
  -- and so on
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Neovide stuff
if vim.g.neovide then
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_no_idle = false
  vim.g.neovide_transparency = 1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_profiler = false
end

-- Vimtex stuff
vim.g.vimtex_view_method = "zathura"
