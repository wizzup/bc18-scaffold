#!/usr/bin/env nix-shell
#!nix-shell -i bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PYTHONPATH="$DIR/battlecode/python:$PYTHONPATH"
export NODOCKER=1
python3 $DIR/battlecode-manager/simple_cli.py "$@"
