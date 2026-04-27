{pkgs, inputs, lib, config, ...} :
{
	boot.loader.systemd-boot.enable = lib.mkDefault true;
	boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;
	boot.initrd.systemd.enable = lib.mkDefault true;

	boot.kernelParams = [ "amd_pstate=active" ];

	i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
	time.timeZone = lib.mkDefault "UTC";

	services.tlp = {
		enable = lib.mkDefault true;
		settings = {
			START_CHARGE_THRESH_BAT0 = 50;
			STOP_CHARGE_THRESH_BAT0 = 90;
		};
	};

	services.thermald.enable = lib.mkDefault true;

	programs.git = {
		enable = true;
		config = {
			init.defaultBranch = "main";
		};
	};

	programs.fish.enable = true;
	programs.fish.shellInit = "fish_vi_key_bindings";
	programs.fish.shellAliases = {
		nixos-switch = "cd /etc/nixos && git add -A && doas nixos-rebuild switch --flake .#${config.networking.hostName}";
		nix-update = "nix flake update && nixos-switch";
		nixos-rebuild = "cd /etc/nixos && git add -A && doas nixos-rebuild switch --flake .#${config.networking.hostName}";
		nixos-dark = "cd /etc/nixos && git add -A && doas nixos-rebuild switch --specialisation dark --flake .#${config.networking.hostName}";
		nixos-light = "cd /etc/nixos && git add -A && doas nixos-rebuild switch --specialisation light --flake .#${config.networking.hostName}";
	};
	programs.starship = {
		enable = true;
		transientPrompt.enable = true;
		settings = {
			character = {
				vimcmd_symbol = "❮ ";
				vimcmd_replace_one_symbol = "❮ ";
				vimcmd_replace_symbol = "❮ ";
				vimcmd_visual_symbol = "❮ ";
			};
		};
	};

	security.sudo.enable = false;
	security.doas = {
		enable = true;
		extraRules = [
		{
			users = [ "rwendell" ];
			keepEnv = true;
			persist = true;
		}
		];
	};

	environment.systemPackages = with pkgs; [
		age
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
			vicinae
	];

	users.users.rwendell = {
		isNormalUser = lib.mkDefault true;
		extraGroups = [ "wheel" "video" ];
		shell = pkgs.fish;
	};

	system.stateVersion = lib.mkDefault "26.05";
}
