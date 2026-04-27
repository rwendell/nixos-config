{ config, ... }:

{
  imports = [
    ./themes/kanso-zen.nix
    ./themes/kanso-ink.nix
    ./themes/kanso-mist.nix
    ./themes/kanso-pearl.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = ./themes/yaml/kanso-zen.yaml;
  };
}
