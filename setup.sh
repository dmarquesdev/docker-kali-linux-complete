#!/bin/bash

# Get all git dependencies
cd git-apps && git submodule init && git submodule update && cd ..
# Add aliases to rc file
PWD=$(pwd)
echo "alias kali='$PWD/run.sh'" >> ~/.zshrc
echo "alias kali-commit='$PWD/commit.sh'" >> ~/.zshrc

cat run_template.sh | sed -E "s#src=path#src=$PWD#g" > run.sh

echo "Now run 'source ~/.zshrc' and './build.sh'"
