{
  description = "Huan's NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=0"
      "https://noctalia.cachix.org"
      "https://niri.cachix.org"
      "https://cache.nixos.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    codex-nix = {
      url = "github:SecBear/codex-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, nixpkgs, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, ... }: {
        formatter = pkgs.nixfmt;
      };
      flake = {
        nixosConfigurations =
          let
            # Every directory under hosts/ becomes a machine.
            isHostDir = name: type: type == "directory" && name != "shared";
            hostNames = builtins.attrNames (nixpkgs.lib.filterAttrs isHostDir (builtins.readDir ./hosts));

            mkHost =
              hostName:
              nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                  ./hosts/${hostName}/default.nix
                ];
                specialArgs = {
                  inherit inputs;
                  inherit hostName;
                };
              };
          in
          builtins.listToAttrs (
            map (name: {
              inherit name;
              value = mkHost name;
            }) hostNames
          );
      };
    };
}
