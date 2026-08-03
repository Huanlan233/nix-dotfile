{ config, lib, ... }:

{
  imports = [
    ./users.nix
    ../../modules/nixos/default.nix
  ];
}
