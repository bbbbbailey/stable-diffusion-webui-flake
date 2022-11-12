{ buildPythonPackage
, fetchPypi
, ...
}:
buildPythonPackage rec {
  pname = "fonts";
  version = "0.0.3";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xiZlW3WmBxXhGOROJwZW/SL9j1QlKQH/br8TCK0BxAU=";
  };
}
