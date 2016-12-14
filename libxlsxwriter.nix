{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  name = "libxlsxwriter";
  version = "0.4.2";
  buildInputs = [pkgs.zlib];
  src = pkgs.fetchurl {
    url = "https://github.com/jmcnamara/${name}/archive/RELEASE_${version}.tar.gz";
    sha256 = "0xpyyxmbmi3kpq0xakpcbwx38pd9709712084smc17h6r9885zni";
  };
  # The distribution's makefile only has the ability to install to /usr.
  installPhase = ''
    mkdir -p $out/include $out/lib
    cp -r include/* $out/include/
    cp -r lib/* $out/lib/
  '';
  meta = {
    homepage = http://libxlsxwriter.github.io/;
    description = "A C library for creating Excel XLSX files";
  };
}
