FROM base-conf:latest
MAINTAINER larioj

RUN mkdir -p $HOME/.emacs.d
RUN mkdir -p $HOME/.emacs.d/plugins

RUN git clone http://git.code.sf.net/p/cedet/git $HOME/.emacs.d/plugins/cedet && \
  cd $HOME/.emacs.d/plugins/cedet && make && cd contrib && make

RUN cd $HOME/.emacs.d/plugins/ && wget http://www.emacswiki.org/emacs/download/evil-elscreen.el

RUN hg clone https://bitbucket.org/lyro/evil $HOME/.emacs.d/plugins/evil && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/evil\")" >> $HOME/.emacs

RUN git clone https://github.com/company-mode/company-mode.git $HOME/.emacs.d/plugins/company-mode && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/company-mode\")" >> $HOME/.emacs

RUN git clone https://github.com/flycheck/flycheck.git $HOME/.emacs.d/plugins/flycheck && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/flycheck\")" >> $HOME/.emacs

RUN git clone https://github.com/abo-abo/function-args.git $HOME/.emacs.d/plugins/function-args && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/function-args\")" >> $HOME/.emacs

RUN git clone https://github.com/capitaomorte/yasnippet.git $HOME/.emacs.d/plugins/yasnippet && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/yasnippet\")" >> $HOME/.emacs

RUN git clone https://github.com/knu/elscreen.git $HOME/.emacs.d/plugins/elscreen && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/elscreen\")" >> $HOME/.emacs

RUN git clone https://github.com/cofi/evil-leader.git $HOME/.emacs.d/plugins/evil-leader && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/evil-leader\")" >> $HOME/.emacs

RUN git clone https://github.com/milkypostman/powerline.git $HOME/.emacs.d/plugins/powerline && \
  echo "(add-to-list 'load-path \"~/.emacs.d/plugins/powerline\")" >> $HOME/.emacs
