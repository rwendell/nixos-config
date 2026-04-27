{ lib, ... }:

{
  options.stylix-themes.kanso-ink = lib.mkOption {
    type = lib.types.attrs;
    description = "Kanso Ink (Dark) - Balanced theme with elegant contrast";
  };

  config.stylix-themes.kanso-ink = {
    slug = "kanso-ink";
    author = "webhooked";
    variant = "dark";
    base00 = "#14171d";  # inkBg0
    base01 = "#1f1f26";  # inkBg1
    base02 = "#22262D";  # inkBg2
    base03 = "#393B44";  # inkBg3
    base04 = "#4b4e57";  # inkBg4
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
