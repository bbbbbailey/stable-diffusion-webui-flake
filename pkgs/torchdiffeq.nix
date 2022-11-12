{ buildPythonPackage
, fetchPypi
, pytorch
, scipy
, ...
}:
buildPythonPackage rec {
  pname = "torchdiffeq";
  version = "0.2.3";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/nX0NLkJCsDCdwLgK+0hRysPhwNb5lgfUe3F1AE+oxo=";
  };
  propagatedBuildInputs = [
    pytorch
    scipy
  ];
  pythonImportsCheck = [ "torchdiffeq" ];
  doCheck = false;
}
