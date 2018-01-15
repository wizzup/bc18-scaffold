#!/usr/bin/env nix-shell
#!nix-shell -i bash -p bash

P1=./mybot
# P2=./examplefuncsplayer-c
P2=./examplefuncsplayer-python

./battlecode.sh -tv -m ./battlecode-maps/socket.bc18map -p1 "$P1" -p2 "$P2"
# ./battlecode.sh -m ./battlecode-maps/socket.bc18map -p1 "$P1" -p2 "$P2"
