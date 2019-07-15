# installing neovim and my needed plugins

First neovim itself:
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Copy `nvim` to `~/.local/share/nvim` - nvim runtime things
Copy `init.vim` to `~/config/nvim/init.vim` - vimrc equivalent of nvim

Neovim package for some typescript stuff is needed:

`npm i -g neovim`

And after that:

`:PlugInstall`

`:UpdateRemotePlugins`

