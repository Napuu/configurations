Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "tirppa"

  config.vm.provider "virtualbox" do |v|
    v.memory = 8096
    v.cpus = 4
  end



  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get autoremove vim -y
    apt-get install -y git software-properties-common

    # go
    export GOVERSION=1.13.4.linux-amd64
    wget https://dl.google.com/go/go$GOVERSION.tar.gz -O /tmp/go$GOVERSION.tar.gz
    tar -C /usr/local -xzf /tmp/go$GOVERSION.tar.gz

    # vim + gdal
    add-apt-repository ppa:neovim-ppa/stable > /dev/null 2>&1
    apt-get update
    apt-get install neovim gdal-bin -y

  SHELL
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile

    # vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # init.vim
    curl -fLo ~/.config/nvim/init.vim --create-dirs \
      https://napuu.xyz/files/init.vim

    # tmux.conf
    curl -fLo ~/.tmux.conf https://napuu.xyz/files/tmux.conf

    # install plugins
    echo "installing vim plugins..."
    vim +'PlugInstall --sync' +qall &> /dev/null
    echo "done"
    echo "installing go binaries..."
    vim +'GoInstallBinaries --sync' +qall &> /dev/null
    echo "done"

  SHELL
end

