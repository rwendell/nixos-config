{ config, pkgs, inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.systemd.enable = true;
	boot.initrd.luks.devices."luks-99617911-0cdb-4012-b833-9b23bc548194".allowDiscards = true;
	boot.initrd.kernelModules = ["amdgpu"];

	networking.wireless.enable = true;
	networking.wireless.networks."espresso".psk = "CaffeinatedKitties";
	networking.hostName = "cappuccino";

	i18n.defaultLocale = "en_US.UTF-8";

	time.timeZone = "UTC";

	security.polkit.enable = true;

	programs.git = {
		enable = true;
		config = {
			init.defaultBranch = "main";
			safe.directory = ["/etc/nixos"];
		};
	};
	programs.fish.enable = true;
	programs.niri.enable = true;

	environment.variables = {
		EDITOR = "${pkgs.neovim}/bin/nvim";
		SUDO_EDITOR = "${pkgs.neovim}/bin/nvim";
	};

	environment.systemPackages = with pkgs; [ 
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
		isNormalUser = true;
		extraGroups = [ "wheel" "video" ];
	};

	system.stateVersion = "26.05";
}
