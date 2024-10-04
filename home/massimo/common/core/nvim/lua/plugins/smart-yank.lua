
return {
  -- would overwrite `ensure_installed` with the new value.
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- If you'd rather extend the default config, use the code below instead:
  {
    "ibhagwan/smartyank.nvim"
  }
}
