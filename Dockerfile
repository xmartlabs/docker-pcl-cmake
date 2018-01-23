FROM ubuntu

WORKDIR /opt

# libproj-dev needed in 16.04: https://stackoverflow.com/a/40034779/1165181 but it shouldn't be needed because now it's compiled from source.
# Compile from source because of https://github.com/PointCloudLibrary/pcl/issues/2147
RUN apt-get update && apt-get install -y \
        build-essential \
        cmake \
        freeglut3-dev \
        git \
        libboost-all-dev \
        libeigen3-dev \
        libfann* \
        libflann-dev \
        libgtest-dev \
        libopenni-dev \
        libopenni2-dev \
        libproj-dev \
        libqhull* \
        libudev-dev \
        libusb-1.0-0-dev \
        libusb-dev \
        libvtk6-dev \
        libvtk6-qt-dev \
        libxi-dev \
        libxmu-dev \
        linux-libc-dev \
        mpi-default-dev \
        openjdk-8-jdk \
        openjdk-8-jre \
        openmpi-bin \
        openmpi-common \
        openssh-client \
        pkg-config \
        qt-sdk \
        valgrind \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/PointCloudLibrary/pcl.git 
WORKDIR /opt/pcl
RUN git checkout pcl-1.8.1
RUN mkdir build
WORKDIR /opt/pcl/build
RUN cmake -DCMAKE_BUILD_TYPE=None -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON ..
RUN make -j2
RUN make -j2 install
RUN make clean
