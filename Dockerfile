FROM golang

RUN apt-get update && \
    apt-get -q -y install apt-utils && \
#>> Postfix setup
apt-get -q -y install \
    vim-nox \
    bash-completion && \
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

COPY dotfiles/bashrc /root/.bashrc
COPY dotfiles/vimrc /root/.vimrc
COPY dotfiles/vim /root/.vim
COPY dotfiles/bash_aliases /root/.bash_aliases
COPY dotfiles/curlrc /root/.curlrc
COPY dotfiles/gitignore_global /root/.gitignore_global
COPY dotfiles/git-prompt-colors.sh /root/.git-prompt-colors.sh
COPY dotfiles/inputrc /root/.inputrc
COPY dotfiles/profile /root/.profile
COPY dotfiles/tmux.conf /root/.tmux.conf
COPY dotfiles/wgetrc /root/.wgetrc
ADD https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash /root/.git-completion.bash 
ADD https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh /root/.git-prompt.sh

# VIM installs
ADD https://tpo.pe/pathogen.vim /root/.vim/autoload/pathogen.vim
RUN apt-get -q -y install ctags && \
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  git clone https://github.com/scrooloose/syntastic.git /root/.vim/bundle/syntastic && \
  git clone git://github.com/tpope/vim-sensible.git /root/.vim/bundle/vim-sensible && \
  git clone https://github.com/majutsushi/tagbar /root/.vim/bundle/tagbar && \
  git clone https://github.com/scrooloose/nerdtree /root/.vim/bundle/nerdtree && \
  git clone https://github.com/itchyny/lightline.vim /root/.vim/bundle/lightline && \
  git clone https://github.com/Shougo/neocomplete.vim.git /root/.vim/bundle/neocomplete && \
  git clone https://github.com/SirVer/ultisnips.git /root/.vim/bundle/ultisnips && \
  git clone https://github.com/t9md/vim-choosewin.git /root/.vim/bundle/vim-choosewin && \
  git clone https://github.com/ctrlpvim/ctrlp.vim.git /root/.vim/bundle/ctrlp.vim && \
  git clone git://github.com/AndrewRadev/splitjoin.vim.git /root/.vim/bundle/splitjoin && \
  git clone https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go && \
  echo vim -e -c "GoInstallBinaries" -c "qa" > /root/runme && echo vim -e -c "Helptags" -c "qa" >> /root/runme && \
  chmod 755 /root/runme

#>> Cleanup
#RUN rm -rf /var/lib/apt/lists/* /tmp/* && \
#apt-get autoremove -y && \
#apt-get autoclean

CMD ["bash"]
