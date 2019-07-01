FROM ubuntu:14.04.3

RUN apt-get update && apt-get install -y git g++ make libncurses5-dev subversion libssl-dev gawk libxml-parser-perl unzip wget python xz-utils libudev-dev curl python-pip
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN useradd openwrt
RUN mkdir /home/openwrt
RUN chown openwrt.openwrt /home/openwrt
RUN npm install -g tsc
RUN npm install -g npm@6.9.0
RUN pip install awscli

RUN chmod -Rf 777 /usr/local/*
WORKDIR /openwrt
