{
  description = "Nix Flake that packages stable-diffusion-webui";

  inputs = {
    # nixpkgs-unstable 11-6-2022
    nixpkgs.url = github:nixos/nixpkgs?rev=8993cc730d11148ef59e84a8f15f94f688e1bfd1;
    master.url = github:nixos/nixpkgs;
    nixos_21-11.url = github:nixos/nixpkgs?rev=eabc38219184cc3e04a974fe31857d8e0eac098d;
    nixos_22-05.url = github:nixos/nixpkgs?rev=f09ad462c5a121d0239fde645aacb2221553a217;
    utils.url = github:gytis-ivaskevicius/flake-utils-plus;
  };


  outputs = inputs@{ self, nixpkgs, nixos_21-11, utils, ... }:
    let
      mkApp = utils.lib.mkApp;
    in
    utils.lib.mkFlake {
      inherit self inputs;

      channelsConfig = {
        allowUnfree = true;
        cudaSupport = true;
      };

      channels.nixpkgs.overlaysBuilder = channels: [
        (final: prev: {
          python310 =
            let
              self = prev.python310.override {
                inherit self;
                packageOverrides = import ./python.nix inputs;
              };
            in
            self;
        })
      ];

      outputsBuilder = channels: rec {
        defaultPackage = channels.nixpkgs.callPackage ./pkgs/stable-diffusion-webui.nix { python = channels.nixpkgs.python310; };
        defaultApp = defaultPackage;
      };
    };
}
