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
, ...
}:
buildPythonPackage rec {
  pname = "basicsr";
  version = "1.4.2";
  src = fetchPypi {
    inherit pname version;
    sha256 = "";
  };
  propagatedBuildInputs = [
    addict
    future
    lmdb
    numpy
    opencv4
    pillow
    pyyaml
    requests
    scikitimage
    scipy
    tensorboard
    pytorch
    torchvision
    tqdm
    yapf
  ];
  pythonImportsCheck = [ "basicsr" ];
}
