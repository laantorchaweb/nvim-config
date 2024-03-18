-- symbols for autocomplete
require('lspkind').init({
    mode = 'symbol',
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = ' 󰌗 ',
      Interface = ' 󰔡',
      Module = ' 󰅩 ',
      Property = '  ',
      Unit = ' 󰑭 ',
      Value = ' 󰎠 ',
      Enum = ' 󰕘',
      Keyword = ' 󰉨 ',
      Snippet = ' 󰃐 ',
      Color = '',
      File = '',
      Folder = ' 󰉖 ',
      EnumMember = '  ',
      Constant = ' 󰇽 ',
      Struct = '  '
    },
})
