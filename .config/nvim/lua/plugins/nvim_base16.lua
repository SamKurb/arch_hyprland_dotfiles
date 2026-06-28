return
{
  'nvim-mini/mini.base16',
  version = false,
  opts = function()
    local wallust_colours = require("visual.wallust_colours")
    return {
      palette = {
        base00 = wallust_colours.colour0,
        base01 = wallust_colours.colour1,
        base02 = wallust_colours.colour2,
        base03 = wallust_colours.colour3,
        base04 = wallust_colours.colour4,
        base05 = wallust_colours.colour5,
        base06 = wallust_colours.colour6,
        base07 = wallust_colours.colour7,
        base08 = wallust_colours.colour8,
        base09 = wallust_colours.colour9,
        base0A = wallust_colours.colour10,
        base0B = wallust_colours.colour11,
        base0C = wallust_colours.colour12,
        base0D = wallust_colours.colour13,
        base0E = wallust_colours.colour14,
        base0F = wallust_colours.colour15,
      }
    }
  end,
  enabled = false,
}
