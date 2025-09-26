#Base image (Ubuntu 22.04)
FROM ubuntu:22.04

#Install dependencies 
RUN apt update && apt install -y \

           build-essential \
           git \
           libpcap-dev \
           linux-headers-$(uname -r) \
           kmod \
           iproute2 \
           iputils-ping \
           net-tools \
           ethtool \
           && rm -rf /var/lib/apt/lists/*

#Clone the Netmap repository
WORKDIR /opt
RUN git clone https://github.com/luigirizzo/netmap.git && \

           cd netmap/LINUX && \
           ./configure && make && make install
           
# Set work directory
WORKDIR /opt/netmap/LINUX/apps
