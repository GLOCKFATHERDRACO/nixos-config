{
  description = "NixOS configuration";

  outputs = inputs @ {nixpkgs, ...}: let
    # -- config
    arch = "x86_64-linux";
    stateVersion = "26.05";
    lib = nixpkgs.lib;

    # -- hosts discovery
    hosts = builtins.filter (host: host != null) (
      lib.mapAttrsToList
      (name: type:
        if type == "directory"
        then name
        else null)
      (builtins.readDir ./nixos/hosts)
    );

    # -- modules
    nixosModules = with inputs; [
      chaotic.nixosModules.nyx-overlay
      disko.nixosModules.disko
      lanzaboote.nixosModules.lanzaboote
      home-manager.nixosModules.home-manager
    ];

    # -- home manager modules
    homeManagerModules = [
      inputs.nixcord.homeModules.nixcord
      inputs.pear-desktop.homeManagerModules.default
    ];

    # -- builders
    mkHost = hostname: let
      hostDir = ./nixos/hosts + "/${hostname}";
      hostConfig = import (hostDir + "/configuration.nix");

      allUsers = lib.unique (hostConfig.system.users ++ hostConfig.system.admin);
      args =
        hostConfig
        // {
          inherit allUsers inputs stateVersion;
        };
    in {
      name = hostname;
      value = lib.nixosSystem {
        specialArgs = args;

        modules =
          [
            ./nixos/default.nix
            hostDir
            {
              networking.hostName = hostname;

              nixpkgs.hostPlatform = arch;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "hm-bak";
                extraSpecialArgs = args;
                sharedModules = homeManagerModules;
              };
            }
          ]
          ++ nixosModules;
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map mkHost hosts);

    formatter.${arch} = nixpkgs.legacyPackages.${arch}.alejandra;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # -- core
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # -- user
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # -- apps
    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    pear-desktop = {
      url = "github:h-banii/pear-desktop-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quadra = {
      url = "github:QuadraHQ/Quadra";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # -- packages
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
}
