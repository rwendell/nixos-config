{ lib, ... }:

{
  options.stylix-themes.kanso-pearl = lib.mkOption {
    type = lib.types.attrs;
    description = "Kanso Pearl (Light) - Light theme for daytime productivity";
  };

  config.stylix-themes.kanso-pearl = {
    slug = "kanso-pearl";
    author = "webhooked";
    variant = "light";
    base00 = "#f2f1ef";  # pearlWhite0
    base01 = "#e2e1df";  # pearlWhite1
    base02 = "#dddddb";  # pearlWhite2
    base03 = "#cacac7";  # pearlWhite3
    base04 = "#9F9F99";  # pearlGray4
    base05 = "#22262D";  # pearlBlack0
    base06 = "#545464";  # pearlBlack1
    base07 = "#43436c";  # pearlBlack2
    base08 = "#c84053";  # pearlRed
    base09 = "#cc6d00";  # pearlOrange
    base0A = "#77713f";  # pearlYellow
    base0B = "#6f894e";  # pearlGreen
    base0C = "#597b75";  # pearlAqua
    base0D = "#4d699b";  # pearlBlue4
    base0E = "#624c83";  # pearlViolet4
    base0F = "#b35b79";  # pearlPink
  };
}
