{inputs, config, pkgs, ...} :
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [
      ./settings.nix
      ./plugins.nix
    ];
  };
}