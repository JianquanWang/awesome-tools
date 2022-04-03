#!/usr/bin/bash

# install rust
echo "##################################"
echo "installing rust"
echo "##################################"
cargo --version > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
fi

echo $PATH | grep -i "/root/.cargo/bin" > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    echo 'export PATH=$PATH:/root/.cargo/bin' >> /etc/bashrc
    source /etc/bashrc
fi

sudo yum update -y > /dev/null 2>&1

# python3
echo "##################################"
echo "installing python3"
echo "##################################"
python3 --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
   sudo yum -y install python3
fi

# install nodejs and npm
echo "##################################"
echo "installing nodejs and npm"
echo "##################################"
node --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo yum install -y nodejs
fi

# fd-find
echo "##################################"
echo "installing fd-find"
echo "##################################"
fd --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    cargo install fd-find
fi
# fzf
echo "##################################"
echo "installing fzf"
echo "##################################"
if [[ ! -d ~/.fzf ]];then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

echo "##################################"
echo "installing tldr"
echo "##################################"
tldr --version > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
   sudo npm install -g tldr
fi

echo "##################################"
echo "installing ripgrep"
echo "##################################"
rg --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    cargo install ripgrep
fi

echo "##################################"
echo "installing fasd"
echo "##################################"
fasd --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    git clone https://github.com/clvv/fasd.git ~/opt/fasd 
    cd ~/opt/fasd
    sudo make install
fi
echo "##################################"
echo "installing broot"
echo "##################################"
broot --version > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    cargo install broot
fi

echo "##################################"
echo "installing nnn"
echo "##################################"
nnn -V > /dev/null 2>&1
if [[ $? -ne 0 ]];then
    sudo yum install -y epel-release
    sudo yum --enablerepo=epel -y install nnn
fi
