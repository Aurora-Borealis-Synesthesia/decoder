Here are the instructions to install OpenCV 2.4.9 on Debian Testing (7.x)
Message for new users

If you are a new Debian user, try installing OpenCV from repositories. As
root:

    aptitude install libopencv-dev

## Reasons to install OpenCV manually

* Debian does not pack the non-free OpenCV module
* Sometimes you want to compile extra features such as OpenCL, Qt, or Intel TBB
* You should know that this solution does not follow the DFSG

Diagnostic

* OpenCV requires ffmpeg
* The official documentation suggest to install Libav
* The installation fails on Debian
* FFmpeg is not available as a package on Debian
* It is required to install FFmpeg manually

Step 0: Check "natural" dependencies on Debian

As root:

    su
    aptitude build-dep libopencv-dev
    exit

Step 1: Remove compromised packages

As root:

    su
    aptitude purge libavcodec-dev libavformat-dev libswscale-dev
    aptitude purge libx264-dev x264
    exit

Step 2: Install dependencies

As root:

    su
    aptitude install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev
    aptitude install yasm
    exit
    Step 3: Install x264

As user:

    mkdir ~/ffmpeg_sources
    cd ~/ffmpeg_sources
    wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
    tar xjvf last_x264.tar.bz2
    cd x264-snapshot*
    ./configure --enable-shared --enable-pic
    make

As root:

    su
    make install
    ldconfig -v
    exit
    Step 4: Install FFmpeg

As user:

    cd ~/ffmpeg_sources
    wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
    tar xjvf ffmpeg-snapshot.tar.bz2
    cd ffmpeg
    ./configure --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfreetype --enable-libtheora --enable-libvorbis --enable-libx264 --enable-nonfree --enable-x11grab --enable-shared --enable-pic
    make

As root:

    su
    make install
    ldconfig -v
    exit
    Step 5: Install OpenCV

As user:

    mkdir ~/opencv_sources
    cd ~/opencv_sources
    wget http://kent.dl.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.9/opencv-2.4.9.zip
    unzip opencv-2.4.9.zip
    cd opencv-2.4.9
    mkdir release
    cd release
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON ..
    make

As root:

    su
    make install
    ldconfig -v
    exit
