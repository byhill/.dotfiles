local setup = function()
  local luasnip = require('luasnip')
  luasnip.config.setup {}
end

return {
  'L3MON4D3/LuaSnip',
  config = function() setup() end,
}
