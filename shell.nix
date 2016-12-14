let
  pkgs = import ./nixpkgs {}; # nixos-16.09
  libxlsxwriter = import ./libxlsxwriter.nix { inherit pkgs; };

in pkgs.haskell.lib.buildStackProject {
  name = "problem";
  ghc = pkgs.haskell.compiler.ghc801;
  buildInputs = with pkgs; [
    libxlsxwriter gmp zlib
  ];

  LD_LIBRARY_PATH = [libxlsxwriter];
}
