{
	description = "NixOS configuration"; 

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-hardware.url = "github:NixOS/nixos-hardware";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		agenix = {
			url = "github:ryantm/agenix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		niri = {
			url = "github:sodiboo/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
nixvim = {
		url = "github:nix-community/nixvim";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	zen-browser = {
		url = "github:0xc000022070/zen-browser-flake";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

	outputs = inputs @ { self, nixpkgs, agenix, home-manager, niri, nixvim, nixos-hardware, ... }: {

		nixConfig = {
			experimental-features = "nix-command flakes";
			substituters = [
				"https://cache.nixos.org"
					"https://nix-community.cachix.org"
			];
		};
nixosConfigurations.cappuccino = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./hosts/cappuccino/default.nix
				niri.nixosModules.niri
				agenix.nixosModules.default
				{
					age.identityPaths = [ "/home/rwendell/.ssh/id_ed25519" ];
					services.openssh.enable = true;

					age.secrets.wifi = {
						file = self + "/secrets/wifi.age";
						owner = "wpa_supplicant";
						group = "wpa_supplicant";
					};

					nixpkgs.config.allowUnfree = true;
				}
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.rwendell = import ./home/default.nix;
						home-manager.extraSpecialArgs = { inherit inputs; };
						home-manager.backupFileExtension = "backup";
						home-manager.sharedModules = [];
					}
			];
		};
	};
}
