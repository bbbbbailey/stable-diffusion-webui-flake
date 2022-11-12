{ buildPythonPackage
, fetchPypi
, basicsr
, facexlib
, lmdb
, numpy
, opencv4
, pyyaml
, scipy
, pytorch
, tensorboard
, torchvision
, tqdm
, yapf
, ...
}:
buildPythonPackage rec {
  pname = "gfpgan";
  version = "1.3.8";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IWGLBs6OpiMESMtSawEgBPI6mrlWtVyDP2m5/IpgxPk=";
  };
  propagatedBuildInputs = [
    basicsr
    facexlib
    lmdb
    numpy
    opencv4
    pyyaml
    scipy
    tensorboard
    pytorch
    torchvision
    tqdm
    yapf
  ];
  pythonImportsCheck = [ "gfpgan" ];
  postPatch = ''
    substituteInPlace requirements.txt --replace "tb-nightly" "tensorboard" --replace "opencv-python" "opencv"
  '';
  doCheck = false;
}
