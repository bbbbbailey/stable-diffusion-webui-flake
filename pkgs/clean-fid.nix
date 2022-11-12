{ buildPythonPackage
, pythonRelaxDepsHook
, fetchPypi
, pytorch
, torchvision
, numpy
, scipy
, tqdm
, pillow
, requests
, ...
}:
buildPythonPackage rec {
  pname = "clean-fid";
  version = "0.1.34";
  src = fetchPypi {
    inherit version;
    pname = "clean_fid";
    format = "wheel";
    dist = "py3";
    python = "py3";
    hash = "sha256-KZf4WmeijJWtqueJmjP8EFNxZP70zdQk4yV7/615qQE=";
  };
  format = "wheel";

  propagatedBuildInputs = [
    pytorch
    torchvision
    numpy
    scipy
    tqdm
    pillow
    requests
  ];
  nativeBuildInputs = [ pythonRelaxDepsHook ];
  pythonRelaxDeps = [ "requests" ];
  pythonImportsCheck = [ "cleanfid" ];
}
