FROM ubuntu:14.04.3

RUN apt-get update
RUN apt-get install -y git g++ make libncurses5-dev subversion libssl-dev gawk libxml-parser-perl unzip wget python xz-utils libudev-dev
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

RUN useradd openwrt
RUN mkdir /home/openwrt
RUN chown openwrt.openwrt /home/openwrt
RUN npm install -g tsc
RUN npm install -g npm@latest

RUN chmod -Rf 777 /usr/local/*
WORKDIR /openwrt
