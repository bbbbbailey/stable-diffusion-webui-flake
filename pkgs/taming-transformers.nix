{ buildPythonPackage
, fetchFromGitHub
, pytorch
, tqdm
, numpy
, pytorch-lightning
, torchvision
, omegaconf
, opencv4
, ...
}:
buildPythonPackage rec {
  pname = "taming-transformers";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "CompVis";
    repo = "taming-transformers";
    rev = "24268930bf1dce879235a7fddd0b2355b84d7ea6";
    hash = "sha256-kDChiuNh/lYO4M1Vj7fW3130kNl5wh+Os4MPBcaw1tM=";
  };
  format = "setuptools";
  propagatedBuildInputs = [
    pytorch
    pytorch-lightning
    numpy
    tqdm
    omegaconf
    torchvision
  ];
  checkInputs = [
    opencv4
  ];
  postPatch = ''
    for dir in $(find ./taming -type d); do touch $dir/__init__.py; done
  '';
  pythonImportsCheck = [ "taming" ];
  # TODO: Needs more dependencies I don't feel like packaging at the moment
  doCheck = false;
}

