

FROM python:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y apt-utils

RUN apt-get install -y checkinstall


RUN apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

RUN cd ~ && git clone https://github.com/vim/vim.git && cd vim && ./configure --with-features=huge \
							--enable-multibyte \
							--enable-rubyinterp=yes \
							--enable-python3interp=yes \
							--with-python3-config-dir=/usr/lib/python3.5/config \
							--enable-perlinterp=yes \
							--enable-luainterp=yes \
							--enable-gui=gtk2 \
							--enable-cscope \
							--prefix=/usr/local  && make VIMRUNTIMEDIR=/usr/local/share/vim/vim81

RUN cd ~/vim && make install

RUN apt-get install -y build-essential cmake

# YouCompleteMe
RUN    git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/YouCompleteMe && \
    cd $HOME/.vim/bundle/YouCompleteMe                                                      && \
    git submodule update --init --recursive                                                 && \
    /usr/bin/python3 ./install.py --clang-completer

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible      && \
# Airline
    git clone https://github.com/bling/vim-airline.git $HOME/.vim/bundle/vim-airline        && \
# CtrlP
    git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim             && \
# Git
    git clone https://github.com/tpope/vim-fugitive.git $HOME/.vim/bundle/vim-fugitive      && \
# Git in the gutter
    git clone https://github.com/airblade/vim-gitgutter.git $HOME/.vim/bundle/vim-gitgutter && \
# Silver search
    git clone https://github.com/rking/ag.vim.git $HOME/.vim/bundle/ag.vim                  && \
# Syntastic
    git clone https://github.com/vim-syntastic/syntastic.git $HOME/.vim/bundle/syntastic && \
# NerdCommenter
    git clone https://github.com/scrooloose/nerdcommenter.git $HOME/.vim/bundle/nerdcommenter && \
# Vim Surround
    git clone https://github.com/tpope/vim-surround.git $HOME/.vim/bundle/vim-surround && \
# Jedi vim
    git clone https://github.com/davidhalter/jedi-vim.git $HOME/.vim/bundle/jedi-vim && \
# NerdTree
    git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree && \
# vim-numbertoggle
    git clone https://github.com/jeffkreeftmeijer/vim-numbertoggle.git $HOME/.vim/bundle/vim-numbertoggle

COPY .vimrc /root/.vimrc


RUN pip3 install ptpython

COPY .ptpython /root/.ptpython

RUN mkdir ~/repos

COPY .bashrc /root
COPY .bash_profile /root
COPY .bash_aliases /root
COPY .profile /root
COPY .inputrc /root
