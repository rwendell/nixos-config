{inputs, config, pkgs, ...} :

{
  imports = [
    ./niri.nix
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
    ./lock-screen.nix
    ./nixvim
  ];

  programs.nixvim.enable = true;

  programs.vicinae = {
    enable = true;
  };

  # Darkman is managed at system level (services.darkman in cappuccino/default.nix)

 	home.stateVersion = "26.05";
}
