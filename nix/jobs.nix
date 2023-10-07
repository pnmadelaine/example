{
  sources ? import ./sources.nix,
  systems ? import ./systems.nix,
  utils ? import ./utils.nix {inherit sources systems;},
}:
utils.eachSystem (
  system: let
    pkgs = sources.nixpkgs.legacyPackages.${system};
    slow = pkgs.runCommand "slow" {} ''
      echo Hello
      for i in $(seq 0 1 100); do
        printf "% 4d%s\n" $i '%'
        sleep 1
      done
      exit 1
    '';
  in {
    inherit (pkgs) hello;
    inherit slow;
  }
)
