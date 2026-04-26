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
	networking.wireless.secretsFile = config.age.secrets.wifi.path;
	networking.wireless.networks."espresso".pskRaw = "ext:psk";

	networking.hostName = "cappuccino";

	i18n.defaultLocale = "en_US.UTF-8";
	time.timeZone = "UTC";

	programs.git = {
		enable = true;
		config = {
			init.defaultBranch = "main";
			safe.directory = ["/etc/nixos"];
		};
	};
programs.fish.enable = true;
	programs.starship = {
		enable = true;
		transientPrompt.enable = true;
	};

	programs.niri.enable = true;

	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.niri}/bin/niri-session";
				user = "rwendell";
			};
		};
	};

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
		isNormalUser = true;
		extraGroups = [ "wheel" "video" ];
		shell = pkgs.fish;
	};

	system.stateVersion = "26.05";
}
