#!/usr/bin/env bash
set -e
if [ "$#" -ne 2 ]; then
    echo "Usage example: $0 gihanmarasingha lean-game-template"
    exit 1
fi

# Ensure tempfile is deleted on exit
trap 'rm -f "$TMPFILE"' EXIT

# Build
make-lean-game

# 3. Deploy
rm -rf deploy
mkdir deploy
cd deploy
git init
cp -r ../html/* .
cp -r ../to-be-deployed/./* .

# Now stage all files, commit, and push
git add .
git commit -m "Update `date`"
git push git@github.com:$1/$2 +HEAD:gh-pages

cd ..
rm -rf deploy