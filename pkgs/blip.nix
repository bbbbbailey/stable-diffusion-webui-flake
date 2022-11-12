{ buildPythonPackage
, fetchPypi
, ...
}:
buildPythonPackage rec {
  pname = "blip";
  version = "0.1.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gI2rL9l5OghnYnVFBWmv5YVeeUhmmIkDmfbaEjKUKRw=";
  };
  pythonImportsCheck = [ "blip" ];
  #doCheck = false;
}
