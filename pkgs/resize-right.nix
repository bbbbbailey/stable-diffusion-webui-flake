{ buildPythonPackage
, fetchPypi
, pytorch
, numpy
, ...
}:
buildPythonPackage rec {
  pname = "resize-right";
  version = "0.0.2";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fcNbcs5AErd/fMkEmDUWN5OrmKWKuIk2EPsRn+Wa9SA=";
  };
  propagatedBuildInputs = [
    pytorch
    numpy
  ];
  pythonImportsCheck = [ "resize_right" ];
}

