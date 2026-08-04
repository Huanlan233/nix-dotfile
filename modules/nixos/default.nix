{ lib, ... }:

let
  inherit (builtins) attrNames readDir;
  inherit (lib) concatMap filterAttrs hasSuffix;

  ignoredDirs = {
    "compositors" = true;
    "display-managers" = true;
    "greeters" = true;
    "input-methods" = true;
    "shells" = true;
  };

  collectNixFiles = dir:
    let
      entries = readDir dir;
      dirs = filterAttrs (
        name: type: type == "directory" && !(ignoredDirs ? name)
      ) entries;
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
