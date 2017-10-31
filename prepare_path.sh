#!/usr/bin/env bash

BREW_PATH='/usr/local/Cellar/'
BREW_CASK_PATH='/usr/local/Caskroom/'

app='coreutils'

brew_validate() {

    if [ -d $BREW_PATH$1 ]
    then
        echo "    installed :: "$1
    else
        echo "not installed :: "$1
    fi
}

app_list=(
    'coreutils'
    'gnupg'
    'macvim'
    'mysql'
    'postgresql'
    'python'
    'python3'
    'tmux'
    'wget'
    'yarn'
    'zsh'
    'zsh-completions'
)


count=0
while [ "x${app_list[count]}" != "x" ]
do
    brew_validate ${app_list[count]}
    count=$(( $count + 1 ))
done
