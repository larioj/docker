FROM ubuntu:latest
MAINTAINER larioj

RUN apt-get update -y
RUN apt-get install -y \
  vim \
  curl \
  ctags \
  git \
  cmake \
  wget \
  llvm-dev

RUN apt-get install --no-install-recommends -y -q \
  build-essential python2.7 python2.7-dev python-pip
