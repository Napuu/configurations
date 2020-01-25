FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install software-properties-common curl git sudo -yq
RUN add-apt-repository ppa:neovim-ppa/stable -y
RUN add-apt-repository ppa:ubuntugis/ppa -y
RUN echo "91.189.88.149 archive.ubuntu.com" >> /etc/hosts
RUN apt-get update -y
RUN apt-get install neovim wget tmux bash-completion gdal-bin libgdal-dev python3.6-dev docker.io locales build-essential cmake p7zip-full docker-compose postgresql-client htop mdp postgis ranger exuberant-ctags gnupg2 pass -y

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN wget https://aka.ms/downloadazcopy-v10-linux -O azcopy.tar.gz
RUN tar -xzvf azcopy.tar.gz
RUN mv ./azcopy_linux*/azcopy /usr/local/bin/azcopy

COPY scripts/mdpa.sh /usr/local/bin/mdpa

ENV GO_VERSION go1.13.5.linux-amd64
RUN wget -q https://dl.google.com/go/$GO_VERSION.tar.gz -O /tmp/$GO_VERSION.tar.gz
RUN tar -C /usr/local -xzf /tmp/$GO_VERSION.tar.gz

RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN adduser pultti --gecos "" --disabled-password
RUN echo "pultti:iowe38" | chpasswd
RUN adduser pultti sudo && adduser pultti docker

USER pultti
WORKDIR /home/pultti

ENV NVM_DIR "/home/pultti/.nvm"
ENV NODE_VERSION 12.13.1
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm i -g http-server neovim
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN mkdir -p ~/.config/nvim
RUN mkdir -p ~/.local/nvim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY neovim/init.vim /home/pultti/.config/nvim/init.vim
RUN vim +silent +PlugInstall +qall

COPY tmux/tmux.conf .tmux.conf
# making sure bashrc is sourced
RUN echo "source \"$HOME/.bashrc\"" >> .bash_profile
RUN echo "source \"$HOME/.profile\"" >> .bash_profile

ENV PATH $PATH:/usr/local/go/bin
RUN vim +GoInstallBinaries +qall
RUN touch ~/.vimtags
RUN chown pultti:pultti ~/.vimtags

RUN echo "ln -sfn /home/pultti/workdir/ssh /home/pultti/.ssh" >> .bashrc

RUN touch ~/.sudo_as_admin_successful

ENV PATH $PATH:/home/pultti/.nvm/versions/node/v$NODE_VERSION/bin
RUN cd /home/pultti/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --go-completer --ts-completer

RUN git config --global user.email "santeri.j.kaariainen@gmail.com" && git config --global user.name "Santeri Kääriäinen"

CMD tmux
