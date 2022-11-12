{ buildPythonPackage
, fetchPypi
, hatchling
, packaging
, ...
}:
buildPythonPackage rec {
  pname = "hatch-requirements-txt";
  version = "0.2.0";
  src = fetchPypi {
    inherit version;
    pname = "hatch_requirements_txt";
    hash = "sha256-I8z34vvPK7Mg9+Xg2nMgNcgeh5QFB0LV2j0iwzA1QGc=";
  };
  format = "pyproject";
  propagatedBuildInputs = [ hatchling packaging ];
}
