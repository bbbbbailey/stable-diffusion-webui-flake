{ nixos_21-11, nixos_22-05, master, ... }: final: prev:
let
  inherit (final.python.pkgs) callPackage;
in
{
  codeformer = callPackage ./pkgs/codeformer.nix { };
  accelerate = callPackage ./pkgs/accelerate.nix { };
  blip = callPackage ./pkgs/blip.nix { };
  basicsr = callPackage ./pkgs/basicsr.nix { };
  clean-fid = callPackage ./pkgs/clean-fid.nix { };
  diffusers = callPackage ./pkgs/diffusers.nix { };
  fairscale = callPackage ./pkgs/fairscale.nix { };
  facexlib = callPackage ./pkgs/facexlib.nix { };
  ffmpy = callPackage ./pkgs/ffmpy.nix { };
  font-roboto = callPackage ./pkgs/font-roboto.nix { };
  fonts = callPackage ./pkgs/fonts.nix { };
  gfpgan = callPackage ./pkgs/gfpgan.nix { };
  gradio = callPackage ./pkgs/gradio.nix { };
  invisible-watermark = callPackage ./pkgs/invisible-watermark.nix { };
  hatch-requirements-txt = callPackage ./pkgs/hatch-requirements-txt.nix { };
  taming-transformers = callPackage ./pkgs/taming-transformers.nix { };
  k-diffusion = callPackage ./pkgs/k-diffusion.nix { };
  kornia = callPackage ./pkgs/kornia.nix { };
  pycryptodome = callPackage ./pkgs/pycryptodome.nix { };
  realesrgan = callPackage ./pkgs/realesrgan.nix { };
  resize-right = callPackage ./pkgs/resize-right.nix { };
  timm = callPackage ./pkgs/timm.nix { };
  clip = callPackage ./pkgs/clip.nix { };
  lpips = callPackage ./pkgs/lpips.nix { };
  torchdiffeq = callPackage ./pkgs/torchdiffeq.nix { };
  h11 = callPackage "${nixos_21-11}/pkgs/development/python-modules/h11" { };
  tensorboard = callPackage "${master}/pkgs/development/python-modules/tensorboard" { };
  linkify-it-py = callPackage "${nixos_21-11}/pkgs/development/python-modules/linkify-it-py" { };
  numba = callPackage "${nixos_22-05}/pkgs/development/python-modules/numba" { };
  numpy = callPackage "${nixos_22-05}/pkgs/development/python-modules/numpy" { };
  llvmlite = callPackage "${nixos_22-05}/pkgs/development/python-modules/llvmlite" { };
  pytorch-lightning = prev.pytorch-lightning.overridePythonAttrs (old: {
    propagatedBuildInputs = old.propagatedBuildInputs ++ [ final.protobuf ];
    postPatch = ''
      substituteInPlace requirements/base.txt --replace "protobuf<=3.20.1" "protobuf"
    '';
  });
  filterpy = prev.filterpy.overridePythonAttrs (old: {
    doCheck = false;
  });
}
