{inputs, config, pkgs, ...} :
{
  imports = [
    ./niri.nix
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
    ./lock.nix
    ./nixvim
  ];

  programs.nixvim.enable = true;

  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    systemd.autoStart = true;
  };


	home.stateVersion = "26.05";
}
