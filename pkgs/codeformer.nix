{ buildPythonPackage
, pythonRelaxDepsHook
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
, tensorboard
, pytorch
, torchvision
, tqdm
, yapf
, lpips
, gdown
, basicsr
, wget
, ...
}:
buildPythonPackage rec {
  pname = "codeformer-perceptor";
  version = "0.1.2";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KZdgSnAGvEqJJgdKqKlEvPk8QTxyogF9cZk1pDYUc3Y=";
  };

  propagatedBuildInputs = [
    basicsr
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
    lpips
    gdown
    wget
  ];

  # Jesus Christ
  postPatch = ''
    substituteInPlace setup.py \
      --replace "tb-nightly>=2.11.0a20221016,<3.0.0" "tensorboard" \
      --replace "opencv-python>=4.6.0.66,<5.0.0.0" "opencv" \
      --replace "scipy>=1.9.2,<2.0.0" "scipy"
  '';
  nativeBuildInputs = [ pythonRelaxDepsHook ];
  pythonRelaxDeps = [ "scipy" "tensorboard" "opencv" ];
  pythonImportsCheck = [ "codeformer" ];
}
