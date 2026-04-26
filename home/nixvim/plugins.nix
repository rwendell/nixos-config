{ lib, ... }:
{
  imports = [
    ./plugins/lsp.nix
    ./plugins/statusline.nix
    ./plugins/editor.nix
    ./plugins/git.nix
    ./plugins/util.nix
    ./plugins/extras.nix
    ./plugins/debug.nix
    ./plugins/test.nix
  ];

  plugins.kanso = {
    enable = true;
    settings.background = {
      dark = "zen";
      light = "pearl";
    };
  };
}