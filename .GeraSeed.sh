#!/bin/sh
promptyn () {
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Por favor responda sim ou não.";;
        esac
    done
}

if promptyn "Gostaria de gerar um senha forte? "; then
    echo "Qual o tamanho da sua senha? " && read tamanho
	echo "****** OK, sua senha será: " && cat /dev/urandom |tr -dc A-Z9|head -c${1:-$tamanho}
	echo " "
	echo "****** Ou você pode escolha esta aqui:" && makepasswd -char=$tamanho
	read nada 
else
    echo "Ok até logo! "
fi
