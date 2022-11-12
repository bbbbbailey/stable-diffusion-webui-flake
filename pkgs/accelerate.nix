{ buildPythonPackage
, fetchPypi
, numpy
, packaging
, psutil
, pyyaml
, pytorch
, ...
}:
buildPythonPackage rec {
  pname = "accelerate";
  version = "0.14.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-McW8xAVk74SbW8HEQkpDzK+eJkE7fficLja/gfBw/UQ=";
  };

  propagatedBuildInputs = [
    numpy
    packaging
    psutil
    pyyaml
    pytorch
  ];
  pythonImportsCheck = [ "accelerate" ];
  #doCheck = false;
}
