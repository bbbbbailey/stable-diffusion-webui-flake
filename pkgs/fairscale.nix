{ buildPythonPackage
, pythonRelaxDepsHook
, fetchPypi
, toPythonModule
, numpy
, pytorch
, ...
}:
buildPythonPackage rec {
  pname = "fairscale";
  version = "0.4.12";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-b2iGFbonVc9Xz4EVVWeV7EBDnQb4tdAbibsvoFpsT34=";
  };
  propagatedBuildInputs = [
    pytorch
    numpy
  ];
  postPatch = ''
    substituteInPlace setup.py --replace 'setup_requires=["ninja"],  # ninja is required to build extensions' ""
  '';
  nativeBuildInputs = [ pythonRelaxDepsHook ];
  pythonRelaxDeps = [ "numpy" ];
  pythonImportsCheck = [ "fairscale" ];
  doCheck = false;
}
