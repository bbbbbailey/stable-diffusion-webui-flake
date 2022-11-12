{ buildPythonPackage
, fetchFromGitHub
, ftfy
, regex
, tqdm
, pytorch
, torchvision
, ...
}:
buildPythonPackage rec {
  pname = "clip";
  version = "1.3.8";
  src = fetchFromGitHub {
    owner = "openai";
    repo = "CLIP";
    rev = "db20393f4affd4158528bd868478e516ebed0944";
    hash = "sha256-d/0IqbDZ+hLIl1/8lsTGUilU+I956X+JKs740ks94s8=";
  };
  propagatedBuildInputs = [
    ftfy
    regex
    tqdm
    pytorch
    torchvision
  ];
  pythonImportsCheck = [ "clip" ];
  #doCheck = false;
}
