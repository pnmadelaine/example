{
  sources ? import ./sources.nix,
  lib ? sources.nixpkgs.lib,
  systems ? import ./systems.nix,
}: {
  eachSystem = lib.genAttrs systems;
}
