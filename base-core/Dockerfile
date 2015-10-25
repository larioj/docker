FROM ubuntu:latest
MAINTAINER larioj

RUN apt-get update -y
RUN apt-get install -y \
  vim \
  emacs \
  curl \
  ctags \
  git \
  cmake \
  wget \
  llvm-dev

RUN apt-get install --no-install-recommends -y -q \
  build-essential python2.7 python2.7-dev python-pip

RUN apt-get install -y mercurial
RUN apt-get install -y texinfo
RUN apt-get install -y install-info
RUN apt-get install -y clang
