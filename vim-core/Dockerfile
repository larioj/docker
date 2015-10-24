FROM base-conf:latest
MAINTAINER larioj

RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
  curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN echo "execute pathogen#infect()" > $HOME/.vim_base.vim && \
  echo "syntax on" >> $HOME/.vim_base.vim && \
  echo "filetype plugin indent on" >> $HOME/.vim_base.vim

RUN git clone https://github.com/Shougo/vimproc.vim.git $HOME/.vim/bundle/vimproc.vim/
RUN cd $HOME/.vim/bundle/vimproc.vim && make

RUN git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/YouCompleteMe/ && \
  cd $HOME/.vim/bundle/YouCompleteMe/ && \
  git submodule update --init --recursive && \
  $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer

RUN git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible/
RUN git clone https://github.com/scrooloose/syntastic.git $HOME/.vim/bundle/syntastic/
RUN git clone https://github.com/ervandew/supertab.git $HOME/.vim/bundle/supertab/
RUN git clone https://github.com/godlygeek/tabular.git $HOME/.vim/bundle/tabular/
RUN git clone https://github.com/bling/vim-airline.git $HOME/.vim/bundle/vim-airline/ && \
  echo "let g:airline#extensions#tabline#enabled = 1" >> $HOME/.vim_base.vim
RUN git clone https://github.com/SirVer/ultisnips.git $HOME/.vim/bundle/ultisnips/ && \
  echo "let g:UltiSnipsExpandTrigger=\"<c-c>\"" >> $HOME/.vim_base.vim && \
  echo "let g:UltiSnipsJumpForwardTrigger=\"<c-b>\"" >> $HOME/.vim_base.vim && \
  echo "let g:UltiSnipsJumpBackwardTrigger=\"<c-z>\"" >> $HOME/.vim_base.vim
RUN git clone https://github.com/honza/vim-snippets.git $HOME/.vim/bundle/vim-snippets/
