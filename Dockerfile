FROM ubuntu

# libproj-dev needed in 16.04: https://stackoverflow.com/a/40034779/1165181
RUN apt-get update && apt-get install -y \
        cmake \
        libpcl-dev \
        libproj-dev \
    && rm -rf /var/lib/apt/lists/*
