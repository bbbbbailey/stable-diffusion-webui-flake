{ buildPythonPackage
, fetchPypi
, addict
, future
, lmdb
, numpy
, opencv4
, pillow
, pyyaml
, requests
, scikitimage
, scipy
, pytorch
, tensorboard
, torchvision
, tqdm
, yapf
, regex
, huggingface-hub
, importlib-metadata
, basicsr
, ...
}:
buildPythonPackage rec {
  pname = "diffusers";
  version = "0.7.1";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Jdbd96iC2gButSJYVGEDTgH+SNiH9yZKzgAbgDMEkYU=";
  };
  propagatedBuildInputs = [
    addict
    basicsr
    future
    lmdb
    numpy
    opencv4
    pillow
    pyyaml
    regex
    requests
    scikitimage
    scipy
    tensorboard
    pytorch
    torchvision
    tqdm
    yapf
    importlib-metadata
    huggingface-hub
  ];
  pythonImportsCheck = [ "basicsr" ];
}
