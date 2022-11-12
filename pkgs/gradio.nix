{ buildPythonPackage
, fetchPypi
, aiohttp
, h11
, fastapi
, ffmpy
, markdown-it-py
, mdit-py-plugins
, matplotlib
, numpy
, orjson
, pandas
, paramiko
, pillow
, pycryptodome
, python-multipart
, pydub
, pyyaml
, requests
, uvicorn
, jinja2
, fsspec
, httpx
, pydantic
, websockets
, hatchling
, hatch-fancy-pypi-readme
, hatch-requirements-txt
, linkify-it-py
, setuptools
, ...
}:
buildPythonPackage rec {
  pname = "gradio";
  version = "3.9";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-prlLYvKBFbHrv8lKtY+1dxZJvicFynGQWnSuT8wEICs=";
  };
  format = "pyproject";
  nativeBuildInputs = [ hatchling hatch-fancy-pypi-readme hatch-requirements-txt ];


  propagatedBuildInputs = [
    aiohttp
    h11
    fastapi
    ffmpy
    hatchling
    markdown-it-py
    mdit-py-plugins
    matplotlib
    numpy
    orjson
    pandas
    paramiko
    pillow
    pycryptodome
    python-multipart
    pydub
    pyyaml
    requests
    uvicorn
    jinja2
    fsspec
    httpx
    pydantic
    websockets
    linkify-it-py
    setuptools
  ];
  pythonImportsCheck = [ "gradio" ];
}
