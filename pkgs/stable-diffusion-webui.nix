{ writeShellApplication
, fetchFromGitHub
, cudatoolkit
, python
}:
let
  env = python.withPackages (pyPkgs: with pyPkgs; [
    basicsr
    diffusers
    fairscale
    fonts
    font-roboto
    gfpgan
    gradio
    invisible-watermark
    numpy
    omegaconf
    opencv4
    requests
    piexif
    pillow
    pytorch-lightning
    realesrgan
    scikitimage
    timm
    transformers
    pytorch
    einops
    jsonmerge
    clean-fid
    resize-right
    torchdiffeq
    kornia
    lark
    inflection
    GitPython
    clip
    k-diffusion
    taming-transformers
    codeformer
    blip
  ]);
  sdSrc = fetchFromGitHub {
    owner = "CompVis";
    repo = "stable-diffusion";
    rev = "69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc";
    hash = "sha256-3YkSUATD/73nJFm4os3ZyNU8koabGB/6iR0XbTUQmVY=";
  };
  src = fetchFromGitHub {
    owner = "bbuscarino";
    repo = "stable-diffusion-webui";
    rev = "578a0a450292962ced4ce9da80aaf5ae67f44857";
    hash = "sha256-FkX9TnlRm6c+jx/vDQN7wjk9FJIcWEXnBBdTw3qQ10I=";
  };
in
writeShellApplication {
  name = "stable-diffusion-webui";
  runtimeInputs = [ cudatoolkit ];
  text = ''
    export CUDA_PATH=${cudatoolkit}
    export COMMANDLINE_ARGS="--precision full --no-half --no-half-vae"
    export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:256
    export PYTHONPATH=${env.sitePackages}:${src}
    export SD_REPO_PATH=${sdSrc}
    export SD_STATE_DIR=~/.sdwebui
    mkdir -p $SD_STATE_DIR
    ${env}/bin/python3 ${../launch.py}
  '';
}
