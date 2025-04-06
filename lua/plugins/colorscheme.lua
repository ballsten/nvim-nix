-- setup theme configuration based on the colorscheme set 
local colorschemeName = nixCats('colorscheme')
if not colorschemeName then
  colorschemeName = 'cyberdream' -- set default
end

-- configuration for colorscheme options
local colorschemeConfigurations = {
  ["cyberdream"] = function ()
    -- Configure Cyberdream
    require("cyberdream").setup({
      transparent = false,
    })
  end,
}

local csConfig = colorschemeConfigurations[colorschemeName]
if not csConfig then
  vim.api.nvim_echo({
    { "Unknown colorscheme: " .. colorschemeName, "ErrorMsg" },
  }, true, {})
end

-- confgure the theme and set it
csConfig(colorschemeName)
vim.cmd.colorscheme(colorschemeName)
