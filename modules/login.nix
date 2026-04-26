{ config, lib, pkgs, ... }:
{
  options = {
    cappuccino.enableLogin = lib.mkEnableOption "login and biometric settings for cappuccino";
  };
  config = lib.mkIf config.cappuccino.enableLogin {
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
    # Greetd config
    services.greetd.enable = true;
    services.greetd.settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri --remember";
        user = "greeter";
      };
    };
    systemd.tmpfiles.rules = [
      "d /var/cache/tuigreet 0755 greeter greeter -"
    ];
  };
}
