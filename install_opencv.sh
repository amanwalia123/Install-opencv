#!/bin/sh
# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove



# INSTALL THE DEPENDENCIES

#install USB Library
sudo apt-get -y install libusb-1.0-0-dev

#Install FFMPEG
sudo apt-get -y install ffmpeg 
 
# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev libgtk-3-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen


sudo apt-get install -y unzip wget
#wget https://github.com/opencv/opencv/archive/2.4.13.6.zip
wget https://github.com/opencv/opencv/archive/3.4.1.zip -O opencv-3.4.1.zip
wget https://github.com/opencv/opencv_contrib/archive/3.4.1.zip -O opencv_contrib-3.4.1.zip
unzip opencv-3.4.1.zip
unzip opencv_contrib-3.4.1.zip
#rm 2.4.13.6.zip
rm opencv-3.4.1.zip opencv_contrib-3.4.1.zip
mv opencv-3.4.1 OpenCV
mv opencv_contrib-3.4.1 OpenCV/
cd OpenCV
mkdir build
cd build
cmake  -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_OPENGL=ON -D ENABLE_FAST_MATH=1  -D WITH_OPENGL=ON -D FORCE_VTK=ON -D WITH_TBB=ON -D WITH_GDAL=ON -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.4.1/modules -D WITH_FFMPEG=ON -D WITH_GTK=ON ..
make -j8
sudo make install
echo '/usr/local/lib' | sudo tee -a /etc/ld.so.conf.d/opencv.conf 
sudo ldconfig
printf '# OpenCV\nPKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig\nexport PKG_CONFIG_PATH\n' >> ~/.bashrc  
source ~/.bashrc 
