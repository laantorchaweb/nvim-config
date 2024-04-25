require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = {         -- :h background
    light = "latte",
    dark = "macchiato",
  },
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  transparent_background = true,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    -- shade = "dark",
    -- percentage = 0.15,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    barbar = true,
    lsp_saga = false,
    lsp_trouble = true,
    -- harpoon = true,
  },
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
    },
    underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
    },
  },
})
