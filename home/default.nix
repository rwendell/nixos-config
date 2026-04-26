{ inputs, config, pkgs, lib, ... }:
{
	imports = [ 
		inputs.nixvim.homeModules.nixvim
		inputs.agenix.homeManagerModules.default
	];
	home.username = "rwendell";
	home.homeDirectory = "/home/rwendell";
	age.identityPaths = [ "/home/rwendell/.ssh/id_ed25519" ];
	programs.nixvim = {
		enable = true;
		defaultEditor = true;
	};
	programs.niri = {
		settings = {
			binds = {
				"Mod+Q".action.spawn = "ghostty"; 
			};
		};
	};
	programs.git = {
		enable = true;
		settings = {
			user.email = "ryanjwendell@gmail.com";
			user.name = "Ryan Wendell";
			init.defaultBranch = "main";
			"github.com".identityFile = config.age.secrets.git-ssh-key.path;
		};
	};
age.secrets.git-ssh-key = {
		file = ../secrets/git-ssh-key.age;
		mode = "0600";
	};

	programs.fish = {
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake .#cappuccino";
		};
	};

	home.stateVersion = "26.05";
}
