let
  pkgs = import ./nixpkgs {}; # nixos-16.09
in pkgs.haskell.lib.buildStackProject {
  name = "problem";
  ghc = pkgs.haskell.compiler.ghc801;
  buildInputs = with pkgs; [
    gmp zlib
  ];
}
