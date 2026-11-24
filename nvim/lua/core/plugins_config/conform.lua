return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = { vhdl = { "my_vhdl" } },
    formatters = {
      my_vhdl = {
        format = function(self, ctx, lines, callback)
          local out = {}
          for _, line in ipairs(lines) do
            line = line:gsub("%s+$", "") -- trim trailing whitespace
            table.insert(out, line)
          end
          callback(nil, out)
        end,
      },
    },
  },
}
