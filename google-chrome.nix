{ lib, stdenv, fetchurl, undmg }:

stdenv.mkDerivation {
  pname = "google-chrome";
  version = "92.0.4515.107";

  src = fetchurl {
    url = "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg";
    sha256 = "sha256-ofcF6QCtplJSFCjXmHqSQkvi8BPdC8mi0JxcEOnrX9k=";
  };

  sourceRoot = "Google Chrome.app";

  buildInputs = [ undmg ];
  installPhase = ''
    mkdir -p "$out/Applications/Google Chrome.app"
    cp -R . "$out/Applications/Google Chrome.app"
  '';

  meta = {
    description = "A freeware web browser developed by Google";
    homepage = "https://www.google.com/chrome/browser/";
    license = lib.licenses.unfree;
    platforms = lib.platforms.darwin;
  };
}
