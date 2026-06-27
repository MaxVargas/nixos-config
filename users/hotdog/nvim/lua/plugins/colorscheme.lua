return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
        style = 'multiplex'
      }
      require('bamboo').load()
    end,
  },
  {
    "savq/melange-nvim"
  },
  {
    "EdenEast/nightfox.nvim"
  },
}
