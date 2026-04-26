{ lib, ... }:
{
  plugins.mini = {
    enable = true;
    surround = true;
    pairs = true;
    ai = true;
  };

  plugins.flash = {
    enable = true;
  };

  plugins.harpoon = {
    enable = true;
  };

  plugins.trouble = {
    enable = true;
  };

  plugins.persistence = {
    enable = true;
  };

  plugins.mini-hipatterns = {
    enable = true;
    highlighters = [
      {
        type = "hex_color";
      }
    ];
  };

  plugins.mini-files = {
    enable = true;
  };

  plugins.render-markdown = {
    enable = true;
  };
}