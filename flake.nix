{
  description = "Nix Flake that packages stable-diffusion-webui";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/release-22.05;
    unstable.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:gytis-ivaskevicius/flake-utils-plus;
  };


  outputs = inputs@{ self, nixpkgs, unstable, utils }:
    utils.lib.mkFlake {
      inherit self inputs;

      channelsConfig.allowUnfree = true;

      channels.nixpkgs.overlaysBuilder = channels: [
        (final: prev: {
          python310 =
            let
              self = prev.python310.override {
                inherit self;
                packageOverrides = import ./python.nix;
              };
            in
            self;
        })
      ];

      outputsBuilder = channels: {
        devShell = channels.nixpkgs.mkShell {
          name = "stable-diffusion-webui";
          buildInputs = with channels.nixpkgs; [
            (python310.withPackages (pyPkgs: with pyPkgs; [
              basicsr #
              diffusers #
              fairscale #
              fonts #
              font-roboto #
              gfpgan #
              gradio #
              invisible-watermark #
              numpy
              omegaconf
              opencv4
              requests
              piexif
              pillow
              pytorch_lightning #
              realesrgan #
              scikitimage
              timm #
              transformers
              pytorch
              einops
              jsonmerge
              clean-fid #
              resize-right #
              torchdiffeq #
              kornia #
              lark
              inflection
              GitPython
            ]))
          ];
        };
      };
    };
}
