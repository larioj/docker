FROM """#"whatever"#""":latest
MAINTAINER larioj

RUN mkdir -p $HOME/.vim/bundle && \
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

COPY vimrc vimrc && \
  mv vimrc $HOME/.vimrc

RUN cd $HOME && vim +PluginInstall +qall
