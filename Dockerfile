FROM ubuntu

RUN apt-get update && apt-get install -y \
        cmake \
        libpcl-dev \
    && rm -rf /var/lib/apt/lists/*
