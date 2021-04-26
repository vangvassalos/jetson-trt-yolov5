#!/bin/bash

set -e


Help()
{
   # Display Help
   echo "Syntax:        build-yolov5s-TRTengine p w e"

   echo "options:"
   echo "p    .pt file"
   echo "w    .wts file to be created"
   echo "e    .engine file to be created"
   echo "-h    help menu"
   echo "example:        build-yolov5s-TRTengine best.pt best.wts best.engine"
   echo
}

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done



pt_file=$1
wts_file=$2
engine_file=$3



python3 ./build-yolov5s-TRTengine/pt2wts.py --pt $pt_file
mkdir -p ./build-yolov5s-TRTengine/build && cd ./build-yolov5s-TRTengine/build && cp ../libmyplugins.so ./ && cmake .. && make && cd ../../
sudo ./build-yolov5s-TRTengine/build/yolov5 -s $wts_file  $engine_file  s

