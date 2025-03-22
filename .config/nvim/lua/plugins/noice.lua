if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/signatureHelp failed",
        },
        opts = { skip = true },
      },
    },
  },
}
