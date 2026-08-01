{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.agenix.nixosModules.default
    ];
}
