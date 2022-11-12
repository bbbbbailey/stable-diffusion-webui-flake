{
  description = "Flake that packages stable-diffusion-webui";

  nixConfig = {
    extra-trusted-substituters = "https://stable-diffusion-webui.cachix.org";
    extra-trusted-public-keys = "stable-diffusion-webui.cachix.org-1:qk3UxlObFfZj/kR6y7f1lecSqYOAG3gGQUXu7jgJsqc=";
  };

  inputs = {
    # nixpkgs-unstable Nov 6 2022
    nixpkgs.url = github:nixos/nixpkgs?rev=8993cc730d11148ef59e84a8f15f94f688e1bfd1;
    # nixpkgs Nov 12 2022
    master.url = github:nixos/nixpkgs?rev=e2bb1e774b5f458de166169d2f6cede6aff9d289;
    nixos_21-11.url = github:nixos/nixpkgs?rev=eabc38219184cc3e04a974fe31857d8e0eac098d;
    nixos_22-05.url = github:nixos/nixpkgs?rev=f09ad462c5a121d0239fde645aacb2221553a217;
    utils.url = github:gytis-ivaskevicius/flake-utils-plus?rev=2bf0f91643c2e5ae38c1b26893ac2927ac9bd82a;
  };

  outputs = inputs@{ self, utils, ... }:
    let
      inherit (utils.lib) mkApp;
    in
    utils.lib.mkFlake {
      inherit self inputs;

      channelsConfig = {
        allowUnfree = true;
        cudaSupport = true;
      };

      channels.nixpkgs.overlaysBuilder = _: [
        (_: prev: prev.lib.genAttrs [ "python" "python3" "python38" "python39" "python310" "python311" ] (py:
          let
            self = prev.${py}.override {
              inherit self;
              packageOverrides = import ./python.nix inputs;
            };
          in
          self))
        (final: _: {
          stable-diffusion-webui = final.callPackage ./pkgs/stable-diffusion-webui.nix { python = final.python310; };
        })
      ];

      outputsBuilder = channels: {
        packages = {
          default = channels.nixpkgs.stable-diffusion-webui;
        };
        apps = rec {
          stable-diffusion-webui = mkApp { drv = channels.nixpkgs.stable-diffusion-webui; };
          cachix-push-all = mkApp {
            drv = channels.nixpkgs.writeShellApplication {
              name = "cachix-push-all";
              runtimeInputs = with channels.nixpkgs; [ jq cachix nix ];
              text = ''
                nix build --json \
                  | jq -r '.[].outputs | to_entries[].value' \
                  | cachix push stable-diffusion-webui
              '';
            };
          };
          default = stable-diffusion-webui;
        };
        formatter = channels.nixpkgs.nixpkgs-fmt;
      };
    };
}
