{
  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs: import ./nix/outputs.nix {sources = inputs;};
}
