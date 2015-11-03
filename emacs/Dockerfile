FROM vim-conf:latest
MAINTAINER larioj

RUN apt-get install -y emacs

COPY emacs emacs
COPY emacs.d emacs.d

RUN mv emacs $HOME/.emacs
RUN mv emacs.d $HOME/.emacs.d
RUN echo "TERM=xterm-256color" >> $HOME/.bashrc
RUN echo "alias e=\"emacs\"" >> $HOME/.bash_aliases
