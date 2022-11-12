{ buildPythonPackage
, fetchPypi
, ...
}:
buildPythonPackage rec {
  pname = "font-roboto";
  version = "0.0.1";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-i8kTa/RmCfuxOvR4MBZ5mxTiPdopSmF5EXHefqLsRX8=";
  };
}
