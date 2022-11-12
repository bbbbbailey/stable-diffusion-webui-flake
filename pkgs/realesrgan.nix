{ buildPythonPackage
, fetchPypi
, basicsr
, facexlib
, gfpgan
, numpy
, opencv4
, pillow
, pytorch
, torchvision
, tqdm
, ...
}:
buildPythonPackage rec {
  pname = "realesrgan";
  version = "0.3.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DTbalqufRHBxYG6R9QLM37CPgMyC7k+Mr3IMd0XM7H4=";
  };
  propagatedBuildInputs = [
    basicsr
    facexlib
    gfpgan
    numpy
    opencv4
    pillow
    pytorch
    torchvision
    tqdm
  ];
  pythonImportsCheck = [ "realesrgan" ];
  postPatch = ''
    substituteInPlace requirements.txt --replace "opencv-python" "opencv"
  '';
  doCheck = false;
}
