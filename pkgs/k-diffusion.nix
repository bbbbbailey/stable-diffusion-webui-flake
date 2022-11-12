{ buildPythonPackage
, fetchPypi
, accelerate
, clean-fid
, clip
, einops
, jsonmerge
, kornia
, pillow
, resize-right
, scikitimage
, scipy
, pytorch
, torchdiffeq
, torchvision
, tqdm
, wandb
, ...
}:
buildPythonPackage rec {
  pname = "k-diffusion";
  version = "0.0.10";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hMhZ8DuUXtTTc4nkV4lci5ZFwrkW5FgOqWkOvurGt5E=";
  };
  propagatedBuildInputs = [
    accelerate
    clean-fid
    clip
    einops
    jsonmerge
    kornia
    pillow
    resize-right
    scikitimage
    scipy
    pytorch
    torchdiffeq
    torchvision
    tqdm
    wandb
  ];
  postPatch = ''
    substituteInPlace setup.cfg --replace "clip-anytorch" "clip"
  '';
  pythonImportsCheck = [ "k_diffusion" ];
}

