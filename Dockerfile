FROM ubuntu:16.04
# Use 16.04 for now, as this issue doesn't happen: https://github.com/PointCloudLibrary/pcl/pull/2100
# When it's fixed, we could update the version.

# libproj-dev needed in 16.04: https://stackoverflow.com/a/40034779/1165181
 RUN apt-get update && apt-get install -y \
          cmake \
          libpcl-dev \
          libproj-dev \
          valgrind \
      && rm -rf /var/lib/apt/lists/*
