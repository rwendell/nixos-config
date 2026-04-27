{ lib, ... }:

{
  options.stylix-themes.kanso-mist = lib.mkOption {
    type = lib.types.attrs;
    description = "Kanso Mist (Dark) - Soft & muted dark theme";
  };

  config.stylix-themes.kanso-mist = {
    slug = "kanso-mist";
    author = "webhooked";
    variant = "dark";
    base00 = "#22262D";  # mistBg0
    base01 = "#2a2c35";  # mistBg1
    base02 = "#393B44";  # mistBg2
    base03 = "#5C6066";  # mistBg3
    base04 = "#909398";  # gray3
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
