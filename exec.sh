#!/bin/bash
a1=../bash.lib/lib_rzhamaletdinov.sh ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Ошибка —
нет библиотеки функций $a1" 1>&2 ; exit 1 ; fi 

read -n 1 -p "Starting script.. Are your shure? (y/n): " AMSURE 
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
echo "Hello Script"

