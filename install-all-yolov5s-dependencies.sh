#!/bin/bash

set -e

work_dir=$(pwd)

cd ./install-yolov5s-dependencies
install_pycuda_v2019.1.2.sh
echo ----------------------------------
echo pycuda v2019.1.2 installed
echo
install_torch_v1.7.0.sh
echo ----------------------------------
echo torch v1.7.0 installed
echo
install_torchvision_v0.8.1.sh
echo ----------------------------------
echo torchvision v0.8.1 installed
echo
python3 -m pip install seaborn tqdm matplotlib
echo ----------------------------------
echo seaborn-tqdm-matpolotlib installed
echo
cd $work_dir
echo ----------------------------------
echo DONE! All dependencies installed
