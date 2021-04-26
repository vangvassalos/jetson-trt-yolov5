#!/bin/bash

set -e

cd ~/Downloads

sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev
git clone --branch v0.8.1 https://github.com/pytorch/vision torchvision
cd torchvision
export BUILD_VERSION=0.8.1
python3 setup.py install --user

cd ../

python3 -c 'import torchvision; print(torchvision.__version__)'

