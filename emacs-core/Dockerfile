FROM vim-conf:latest
MAINTAINER larioj

RUN mkdir -p $HOME/.emacs.d
RUN mkdir -p $HOME/.emacs.d/themes

RUN git clone http://git.code.sf.net/p/cedet/git $HOME/.emacs.d/cedet && \
  cd $HOME/.emacs.d/cedet && make && cd contrib && make

RUN cd $HOME/.emacs.d/ && wget http://www.emacswiki.org/emacs/download/evil-elscreen.el
RUN cd $HOME/.emacs.d/themes/ && wget https://raw.githubusercontent.com/owainlewis/emacs-color-themes/master/themes/spolsky-theme.el

RUN hg clone https://bitbucket.org/lyro/evil $HOME/.emacs.d/evil && \
  echo "(add-to-list 'load-path \"~/.emacs.d/evil\")" >> $HOME/.emacs

RUN git clone https://github.com/company-mode/company-mode.git $HOME/.emacs.d/company-mode && \
  echo "(add-to-list 'load-path \"~/.emacs.d/company-mode\")" >> $HOME/.emacs

RUN git clone https://github.com/flycheck/flycheck.git $HOME/.emacs.d/flycheck && \
  echo "(add-to-list 'load-path \"~/.emacs.d/flycheck\")" >> $HOME/.emacs

RUN git clone https://github.com/abo-abo/function-args.git $HOME/.emacs.d/function-args && \
  echo "(add-to-list 'load-path \"~/.emacs.d/function-args\")" >> $HOME/.emacs

RUN git clone https://github.com/capitaomorte/yasnippet.git $HOME/.emacs.d/yasnippet && \
  echo "(add-to-list 'load-path \"~/.emacs.d/yasnippet\")" >> $HOME/.emacs

RUN git clone https://github.com/knu/elscreen.git $HOME/.emacs.d/elscreen && \
  echo "(add-to-list 'load-path \"~/.emacs.d/elscreen\")" >> $HOME/.emacs

RUN git clone https://github.com/cofi/evil-leader.git $HOME/.emacs.d/evil-leader && \
  echo "(add-to-list 'load-path \"~/.emacs.d/evil-leader\")" >> $HOME/.emacs

RUN git clone https://github.com/milkypostman/powerline.git $HOME/.emacs.d/powerline && \
  echo "(add-to-list 'load-path \"~/.emacs.d/powerline\")" >> $HOME/.emacs
