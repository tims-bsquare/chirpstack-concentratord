{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz") {} }:

pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.pkg-config
  ];
  buildInputs = [
    pkgs.cacert
    pkgs.rustup
    pkgs.cargo-cross
    pkgs.cargo-deb
    pkgs.jq
    pkgs.opkg-utils
  ];
  shellHook = ''
    export PATH=$PWD/.cargo/bin:$PATH
  '';
  DOCKER_BUILDKIT = "1";
  NIX_STORE = "/nix/store";
}
