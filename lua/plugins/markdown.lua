return {
  -- Disable markdownlint-cli2 diagnostics from the lang.markdown extra.
  -- Must be a function override: an empty list wouldn't survive lazy.nvim's
  -- deep merge with the extra's { markdown = { "markdownlint-cli2" } }.
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = nil
    end,
  },
}
