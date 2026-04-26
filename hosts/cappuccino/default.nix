{config, pkgs, inputs, ...} :

{
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen3
  ];

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
  };

  boot.initrd.luks.devices."luks-99617911-0cdb-4012-b833-9b23bc548194".allowDiscards = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "quiet" "loglevel=3" "systemd.show_status=auto" ];

  boot.initrd.systemd.enable = true;

  environment.systemPackages = with pkgs; [ tpm2-tss ];

  networking.wireless.enable = true;
  networking.wireless.secretsFile = config.age.secrets.wifi.path;
  networking.wireless.networks."espresso".pskRaw = "ext:psk";

  networking.hostName = "cappuccino";

  programs.git.config.safe.directory = ["/etc/nixos"];

  programs.fish.shellAliases = {
    rebuild = "doas nixos-rebuild switch --flake /etc/nixos#cappuccino";
  };

  # Fingerprint authentication
  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-goodix;
  };

  # Polkit for fingerprint authorization
  security.polkit.enable = true;

  # PAM configuration for fingerprint auth
  security.pam.services = {
    greetd.fprintAuth = true;
    doas.fprintAuth = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri --remember";
        user = "greeter";
      };
    };
  };

  # Create tuigreet cache dir for --remember feature
  systemd.tmpfiles.rules = [
    "d /var/cache/tuigreet 0755 greeter greeter -"
  ];

  programs.niri.enable = true;
}