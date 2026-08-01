{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ 
            ../../../../homes/default/default.nix
        ];
    };

    home-manager.users = {
        huan = import ../../../../homes/huan/default.nix;
    };
}
