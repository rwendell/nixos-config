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
}