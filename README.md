## Build and run yolov5s-TRT on Jetson devices
This guide is tested on Jetson Nano, Xavier NX and Xavier AGX, all running Jetpack v4.4.1 (with openCV 4.1.1) for the yolo-v5s architecture and is heavily based on https://github.com/ultralytics/yolov5 repo.

### Prerequisites
- A yolov5 model trained in pyTorch with a generated *.pt* file
- A Jetson device running Jetpack v4.4.1
- Installed dependencies as in Step1 below. Mainly: 
	- pyCude v2019.1.2
	- torch v1.7.0
	- torchvision v0.8.1
	- seaborn, tqdm, matplotlib

### Steps
1. install yolov5s dependencies (either all by running *$install-all-yolov5s-dependencies.sh*) or each one seperately from *install-yolov5s-dependencies* folder
2. place your yolov5 *.pt* file in the root folder of the repo
3. build the TRTengine by running  *$sudo build-yolov5s-TRTenigne.sh   pt_file wts_file   engine_file*. As a result, the engine file will be built in the repo's root dir along with the intermediate *wts_file*. The conversion steps are : pt_file --> wts_file --> TRTengine_file
4. test the engine by a) placing some test images on the folder *./test_Images/* (or any other folder you like) and run  *python3 run-yolov5s-trt.py* --folder *images_dir* --engine *trt_egnine_file*
