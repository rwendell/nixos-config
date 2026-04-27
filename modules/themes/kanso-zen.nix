{ lib, ... }:

{
  options.stylix-themes.kanso-zen = lib.mkOption {
    type = lib.types.attrs;
    description = "Kanso Zen (Dark) - Deep & rich dark theme for focused coding";
  };

  config.stylix-themes.kanso-zen = {
    slug = "kanso-zen";
    author = "webhooked";
    variant = "dark";
    base00 = "#1C1E25";  # zenBg1
    base01 = "#22262D";   # zenBg2
    base02 = "#393B44";    # zenBg3
    base03 = "#717C7C";   # gray
    base04 = "#A4A7A4";   # gray2
    base05 = "#C5C9C7";  # fg
    base06 = "#f2f1ef";   # fg2
    base07 = "#f2f1ef";   # fg2
    base08 = "#C34043";   # red
    base09 = "#b6927b";   # orange
    base0A = "#DCA561";   # yellow
    base0B = "#98BB6C";  # green
    base0C = "#8ea4a2";  # aqua
    base0D = "#7FB4CA";  # blue
    base0E = "#938AA9";  # violet
    base0F = "#a292a3";  # pink
  };
}
