FROM base-conf:latest
MAINTAINER larioj

RUN apt-get install -y \
  python-numpy \
  python-scipy \
  python-matplotlib \
  python-nltk \
  python-sklearn \
  ipython ipython-notebook \
  python-pandas \
  python-sympy \
  python-nose

RUN apt-get install -y python-skimage

RUN apt-get install -y python-opencv
RUN pip install -U pip
RUN pip install -U nltk
