{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nypkgs = {
    	url = "github:yunfachi/nypkgs";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, nypkgs,...}@input:
  let
    system = "x86_64-linux";
    inherit (nixpkgs) lib;
    specialArgs = {
    	cfglib = import ./lib {inherit lib;};
    };
  in
  {
    nixosConfigurations = {
    	yoru = nixpkgs.lib.nixosSystem {
        	inherit system;
        	modules = [
	          ./nixos/configuration.nix
        	  nixos-wsl.nixosModules.default
        	  {
        	    system.stateVersion = "24.05";
        	    wsl.enable = true;
        	  }
        	];
	};
    };
    homeConfigurations = {
    	"massimo@yoru" = home-manager.lib.homeManagerConfiguration {
		extraSpecialArgs = specialArgs // {host = "yoru";};
		pkgs = nixpkgs.legacyPackages.${system};
        	modules = [
		        ./home/massimo/yoru.nix
        	];
	};
    	"massimo@tsuki" = home-manager.lib.homeManagerConfiguration {
		pkgs = nixpkgs.legacyPackages.${system};
        	#modules = [
		#  ./home/massimo/tsuki.nix
        	#];
	};

    };

  };
}
