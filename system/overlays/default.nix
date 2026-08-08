[
  (final: _: {
    # niri-flake still references this package after nixpkgs removed it.
    libdisplay-info_0_2 = final.callPackage ./libdisplay-info.nix { };
  })
]
