{ lib, ... }:
{
  plugins.lualine = {
    enable = true;
    autoLoad = true;
    settings = {
      options = {
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "ministarter"
            "snacks_dashboard"
          ];
        };
      };
      sections = {
        lualine_c = [
          "filename"
        ];
      };
    };
  };
}