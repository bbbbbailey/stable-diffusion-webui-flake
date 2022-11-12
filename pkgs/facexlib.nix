{ buildPythonPackage
, fetchPypi
, cython
, numpy
, pillow
, opencv4
, pytorch
, tqdm
, torchvision
, filterpy
, numba
, scipy
, ...
}:
buildPythonPackage rec {
  pname = "facexlib";
  version = "0.2.5";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MeIMxO1dY1YtOA5FZLrhSsDV0YmaB5uth2IeE1ZFZ+Q=";
  };
  propagatedBuildInputs = [
    cython
    numpy
    pillow
    opencv4
    numba
    pytorch
    tqdm
    scipy
    torchvision
    filterpy
  ];
  postPatch = ''
    substituteInPlace requirements.txt --replace "opencv-python" "opencv"
  '';
  pythonImportsCheck = [ "facexlib" ];
}
