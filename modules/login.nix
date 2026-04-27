{ config, lib, pkgs, ... }:
{
  options = {
    cappuccino.enableLogin = lib.mkEnableOption "login and biometric settings for cappuccino";
  };
  config = lib.mkIf config.cappuccino.enableLogin {
    # Fingerprint authentication service
    services.fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
    # Polkit for authorization
    security.polkit.enable = true;
    # PAM: fingerprint OR password (fingerprint enabled, falls back to password)
    security.pam.services = {
      greetd.fprintAuth = true;
      doas.fprintAuth = true;
    };
    # Greetd config
    services.greetd.enable = true;
    services.greetd.settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.niri}/bin/niri-session --remember";
        user = "greeter";
      };
    };
    systemd.tmpfiles.rules = [
      "d /var/cache/tuigreet 0755 greeter greeter -"
    ];
  };
}
