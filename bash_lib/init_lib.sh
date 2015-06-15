#!/bin/bash

#include file lib_rzhamaletdinov.sh
a1=lib_rzhamaletdinov.sh ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error! Lib file $a1 not exist!" 1>&2 ; exit 1 ; fi

myAskYN "Init lib in /usr/bin. Are you shure?";
echo Processing...;
sudo ln -s $a1 /usr/bin/lib_rzhamaletdinov.sh;
echo /usr/bin/$a1 succefully created!;
sayWait;
