{ buildPythonPackage
, fetchPypi
, ...
}:
buildPythonPackage rec {
  pname = "ffmpy";
  version = "0.3.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dXWRWB7uJbSlCsn/ubWANaJ5RTPbR+BRL1P7LXtvmtw=";
  };
  pythonImportsCheck = [ "ffmpy" ];
}
