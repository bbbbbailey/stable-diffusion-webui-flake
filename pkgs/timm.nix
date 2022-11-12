{ buildPythonPackage
, fetchPypi
, pytorch
, torchvision
, pyyaml
, huggingface-hub
, ...
}:
buildPythonPackage rec {
  pname = "timm";
  version = "0.6.11";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CVaIQrZau9jJmGSriT7AkC+K1XfQEStF4TI+csp7P6U=";
  };
  propagatedBuildInputs = [
    pytorch
    torchvision
    pyyaml
    huggingface-hub
  ];
  pythonImportsCheck = [ "timm" ];
  doCheck = false;
}
