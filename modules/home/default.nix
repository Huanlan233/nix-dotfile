{ lib, ... }:

let
  inherit (builtins) attrNames readDir;
  inherit (lib) concatMap filterAttrs hasSuffix;

  collectNixFiles = dir:
    let
      entries = readDir dir;
      dirs = filterAttrs (_: type: type == "directory") entries;
      files = filterAttrs (
        name: type:
          type == "regular"
          && hasSuffix ".nix" name
          && name != "default.nix"
      ) entries;

      filePaths = map (name: dir + "/${name}") (attrNames files);
      nestedPaths = concatMap
        (name: collectNixFiles (dir + "/${name}"))
        (attrNames dirs);
    in
    filePaths ++ nestedPaths;
in
{
  imports = collectNixFiles ./.;
}
