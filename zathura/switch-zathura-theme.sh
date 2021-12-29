#!/usr/bin/env bash

if [[ $1 = light ]]; then
    ln -sf ~/.config/zathura/zathurarc-gbm-light ~/.config/zathura/zathurarc
elif [[ $1 = dark ]]; then
    ln -sf ~/.config/zathura/zathurarc-gbm-dark ~/.config/zathura/zathurarc
elif [[ $1 = install ]]; then
    SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    echo "installing ${SCRIPT_DIR}/switch-zathura-theme.sh to ~/.local/share/bin"
    ln -sf ${SCRIPT_DIR}/switch-zathura-theme.sh ~/.local/share/bin
else
    echo "Please choose either dark or light"
fi 
