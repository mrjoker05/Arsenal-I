#!/bin/bash

help(){
    echo
    echo "Usage: ./deploy.sh"
    echo
}

base(){
    sudo apt update && sudo apt full-upgrade -y
    sudo apt autoclean -y
}

create_dirs(){
    mkdir -p ~/HackSpace
    mkdir -p ~/CodeSpace
    mkdir -p ~/Repos
    rm -rf ~/Templates ~/Videos ~/Music ~/Public
}

download_repos(){
    git clone https://github.com/mrjoker05/DotFiles ~/Repos/DotFiles
}

dot_files(){
    cd /tmp
    git clone https://github.com/mrjoker05/DotFiles
    cp DotFiles/vimrc ~/.vimrc
    cp DotFiles/tmux.conf ~/.tmux.conf
}

install_tools(){
    sudo apt install tmux git \
    toilet net-tools jq -y
}


main(){
    base
    install_tools
    create_dirs
    download_repos
    dot_files
}

if [[ @$ -eq 1 ]]
then
    help
elif
    main
fi

