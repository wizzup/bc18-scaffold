#!/usr/bin/env nix-shell
#!nix-shell -i bash -p python3

mtput() {
    if command -v tput > /dev/null; then
        tput $@
    fi
}

echo "=== STARTING THE MANAGER (no docker) ==="
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PYTHONPATH="$DIR/battlecode/python:$PYTHONPATH"
export NODOCKER=1
mtput setaf 5
echo "$ python3 $DIR/battlecode-manager/gui.py"
mtput sgr0
python3 $DIR/battlecode-manager/gui.py
