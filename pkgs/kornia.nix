{ buildPythonPackage
, fetchPypi
, pytorch
, pytest-runner
, packaging
, ...
}:
buildPythonPackage rec {
  pname = "kornia";
  version = "0.6.8";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CYXgJFPAq08DDo0io6dVTasxL/qPilTshyGQ5vC1jFY=";
  };
  nativeBuildInputs = [
    pytest-runner
  ];
  propagatedBuildInputs = [
    pytorch
    packaging

  ];
  pythonImportsCheck = [ "kornia" ];
  doCheck = false;
}
