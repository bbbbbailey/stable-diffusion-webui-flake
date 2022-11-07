final: prev:
let
  inherit (final.python.pkgs) callPackage;
in
{
  basicsr = callPackage ./pkgs/basicsr.nix { };
  diffusers = callPackage ./pkgs/diffusers.nix { };
}
