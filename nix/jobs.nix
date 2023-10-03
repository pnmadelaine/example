{
  sources ? import ./sources.nix,
  systems ? import ./systems.nix,
  utils ? import ./utils.nix {inherit sources systems;},
}:
utils.eachSystem (
  system: let
    pkgs = sources.nixpkgs.legacyPackages.${system};
  in {
    inherit (pkgs) hello;
  }
)
