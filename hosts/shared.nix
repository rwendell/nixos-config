{ config, pkgs, inputs, lib, ... }:
{
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;
  boot.initrd.systemd.enable = lib.mkDefault true;

  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
  time.timeZone = lib.mkDefault "UTC";

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
    };
  };

  programs.fish.enable = true;
  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
  };

  programs.niri.enable = true;

  environment.variables = {
    SUDO_EDITOR = "${pkgs.neovim}/bin/nvim";
  };

  environment.systemPackages = with pkgs; [
    age
    doas
    lazygit
    opencode
    ghostty
    keepassxc
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    brightnessctl
    hypridle
    hyprlock
    awww
    wpa_supplicant
  ];

  users.users.rwendell = {
    isNormalUser = lib.mkDefault true;
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.fish;
  };

  system.stateVersion = lib.mkDefault "26.05";
}