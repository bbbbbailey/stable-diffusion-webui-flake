{ buildPythonPackage
, fetchPypi
, ...
}:
buildPythonPackage rec {
  pname = "pycryptodome";
  version = "3.15.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kTXd2tUEWSvMGLDS2VzobDpeqH7GRH7yXP7eoS1gGLg=";
  };
  pythonImportsCheck = [ "Crypto" ];
}
