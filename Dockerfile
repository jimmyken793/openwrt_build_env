FROM ubuntu:14.04.5

RUN apt-get update
RUN apt-get install -y git g++ make libncurses5-dev subversion libssl-dev gawk libxml-parser-perl unzip wget python xz-utils libudev-dev curl python3-pip
RUN apt-get install -y gcc-multilib g++-multilib build-essential software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y --force-yes nodejs
RUN apt-get install gcc-6 g++-6 -y
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6

RUN useradd openwrt
RUN mkdir /home/openwrt
RUN chown openwrt.openwrt /home/openwrt
RUN npm install -g tsc
RUN npm install -g npm@6.9.0
RUN pip3 install awscli typing

RUN chmod -Rf 777 /usr/local/*

RUN apt-get upgrade -y

WORKDIR /openwrt
