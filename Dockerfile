
FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test

# Install gcc and g++ 5
RUN apt-get update
RUN apt-get install -y gcc-5 g++-5 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
RUN update-alternatives --set cc /usr/bin/gcc

RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
RUN update-alternatives --set c++ /usr/bin/g++


# Install cmake and dependencies
RUN apt-get install -y build-essential
RUN apt-get install -y cmake

# Install numerical libraries
RUN apt-get install -y libgoogle-glog-dev libgflags-dev liblapack-dev


# Create a directory /app in the container
RUN mkdir app

# Set directory /app as the working directory where future
# RUN, CMD and ADD instructions will operate
WORKDIR /app

# Copy the contents from local machine to container
ADD . /app/

RUN ./setup.sh

