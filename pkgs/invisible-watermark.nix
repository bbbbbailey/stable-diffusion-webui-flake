{ buildPythonPackage
, fetchPypi
, opencv4
, pytorch
, onnx
, onnxruntime
, pillow
, pywavelets
, numpy
, ...
}:
buildPythonPackage rec {
  pname = "invisible-watermark";
  version = "0.1.5";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-djEUZMaQxm1U+yt8AUh1N/wgByY34F/ok5l3CgR9rUo=";
  };
  postPatch = ''
    substituteInPlace setup.py --replace "opencv-python" "opencv"
  '';
  propagatedBuildInputs = [
    opencv4
    pytorch
    onnx
    onnxruntime
    pillow
    pywavelets
    numpy
  ];
}
