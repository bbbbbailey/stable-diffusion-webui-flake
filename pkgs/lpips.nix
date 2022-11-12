{ buildPythonPackage
, fetchPypi
, pytorch
, torchvision
, numpy
, scipy
, scikitimage
, opencv4
, matplotlib
, tqdm
, jupyter
, ...
}:
buildPythonPackage rec {
  pname = "lpips";
  version = "0.1.4";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OEYzHfbGloiuw9MApe7vbFKUNbyEYL1YIBw9YuVhiPo=";
  };
  propagatedBuildInputs = [
    pytorch
    torchvision
    numpy
    scipy
    scikitimage
    opencv4
    matplotlib
    tqdm
    jupyter
  ];
  pythonImportsCheck = [ "lpips" ];
  doCheck = false;
}
