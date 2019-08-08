FROM ubuntu:18.04


RUN apt-get update -y
RUN apt-get install software-properties-common curl git -yq
RUN add-apt-repository ppa:neovim-ppa/stable -y
RUN apt-get update -y
# install with software-properties-common failed for some reason
RUN apt-get install tmux -y

RUN apt-get install neovim -yq
RUN adduser sohva --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
RUN echo "sohva:iowe38" | chpasswd
WORKDIR /ext_mount
RUN mkdir /usr/local/nvm
# install latest node 
ENV NVM_DIR /usr/local/nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
ENV NODE_VERSION v10.16.0
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# install neovim and configure plugins
RUN npm i -g neovim

RUN mkdir -p .local/share/
RUN mkdir -p .config/nvim/
COPY neovim/nvim /home/sohva/.local/share/nvim
COPY neovim/init.vim /home/sohva/.config/nvim/
RUN chown -R sohva /ext_mount*
RUN chown -R sohva /home/sohva*
RUN chown -R sohva /usr/local*
USER sohva
# some plugins are broken (tsc) but is fine :-)
RUN nvim +PlugInstall +qall > /dev/null
RUN nvim +UpdateRemotePlugins +qall > /dev/null

VOLUME /ext_mount
COPY tmux/tmux.conf /home/sohva/.tmux.conf

#CMD /usr/bin/tmux
CMD tail -f /dev/null
