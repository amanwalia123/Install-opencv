# Install OpenCV on Ubuntu/Debian based systems
I have used following scripts to install opencv on Raspberry Pi, and linux boxes. You may find the provided scripts useful.

## Getting Started
Download or clone this repository to your local File System.I have provided two scripts for installation with/without CUDA.Choose the file whivh suits you.

### Installing
Move to the folder using
```
cd Install-opencv
```
#### Install without CUDA
To install without CUDA enabled, use the following command:
```
sudo bash install_opencv.sh
```
#### Install with CUDA
To install with CUDA enabled, run the following commands first: 
```
sudo apt-get install build-essential
sudo apt-get install linux-generic

```
Download the CUDA .deb file for Linux Ubuntu 14.04(or whichever version of ubuntu you are using) from this [page](https://developer.nvidia.com/cuda-downloads)
It would be a file named similar this: cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb(i am using cuda 8.0 so probbaly install that). Now, move to the directory where you downloaded it & install it using:
```
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo "export PATH=/usr/local/cuda/bin/:\$PATH; export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc
```
Restart your computer

##### Install CuDNN

Go to [here](https://developer.nvidia.com/cuDNN) and use the Download button (you have to register and login to download. no way around that.)
Download cuDNN R3 for Linux. You will download a file cudnn-8.0-linux-x64-v3.0-prod.tgz(or ) then use the commands:
tar -xvf cudnn-7.0-linux-x64-v3.0-prod.tgz
sudo cp cuda/include/*.h /usr/local/cuda/include
sudo cp cuda/lib64/*.so* /usr/local/cuda/lib64

##### Install OpenCV
Install opencv now using 
```
sudo bash install_opencv_cuda.sh
```
## Authors

* **Amanpreet Walia**
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
