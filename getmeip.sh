#!/bin/bash

help(){
    echo 
    echo "Usage: ./getmeip <filename>"
    echo "cat file | ./getmeip"
    echo
}

main(){
    grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $1
}

[ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
main $input