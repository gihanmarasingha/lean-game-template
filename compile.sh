#!/usr/bin/env bash

rm -rf html/ ; cd src/ ;
find . -name "*olean" -print0 | xargs -0 rm
cd ../ ; make-lean-game
