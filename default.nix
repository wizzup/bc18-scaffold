{ pkgs ? import <nixpkgs> {} }:

with pkgs;
with python3Packages;

let
  gevent-websocket = buildPythonPackage rec {
    pname = "gevent-websocket";
    version = "0.10.1";
    name = "${pname}-${version}";
    buildInputs = [ gevent gunicorn];

    src = fetchPypi {
      inherit pname version;
      sha256 = "1c2zv2rahp1gil3cj66hfsqgy0n35hz9fny3ywhr2319d0lz7bky";
    };
  };

  bottle-websocket = buildPythonPackage rec {
    pname = "bottle-websocket";
    version = "0.2.9";
    name = "${pname}-${version}";
    buildInputs = [ gevent gevent-websocket bottle ];

    src = fetchPypi {
      inherit pname version;
      sha256 = "12vkxigkx5pxh5dkvn2hip86rpnyjnm186nis3c2wnf7q06zg1wq";
    };
  };

  eel = buildPythonPackage rec {
    pname = "Eel";
    version = "0.8.0";
    name = "${pname}-${version}";
    propagatedBuildInputs = [ bottle bottle-websocket gevent gevent-websocket ];
    doCheck = false;

    src = fetchPypi {
      inherit pname version;
      sha256 = "1jzb14ik5ycxxjl2acc60a5pfqdai2xxy0kdxhxlc9wjjgp0lys3";
    };
  };

  py3s = python3.buildEnv.override  {
    extraLibs = [ cffi eel tqdm werkzeug psutil ];
  };
in stdenv.mkDerivation {
  name = "bc18-scaf";
  buildInputs = [ py3s ];

  shellHook = ''
    export PS1="\[\033[1;32m\][$name:\w]\n$ \[\033[0m\]"

    export "PYTHONPATH=./battlecode/python:$PYTHONPATH"
  '';
}

