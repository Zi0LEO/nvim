return  
{
  'sainnhe/gruvbox-material',
  name = "gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = '1'
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = '1'
    vim.cmd.colorscheme('gruvbox-material')
   end,
    }