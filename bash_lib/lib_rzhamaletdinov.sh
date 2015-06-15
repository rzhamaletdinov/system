#!/bin/bash
curPath=
cRes=
pYes=

mwSetCurPath()
{
	local a1

	a1="${curScript%/*}"
	pushd "$a1" &> /dev/null
	curPath="$(pwd)"
	popd &> /dev/null
	if [ "$curScript" != "bash" ] && [ "${curScript%/bash}" = "$curScript" ] ; then
		:
	else
		echo "Cannot determine current script name. Aborted." 1>&2
		exit 1
	fi
}
myAskYN()
{  
	local AMSURE
	if [ -n "$1" ] ; then
		read -n 1 -p "$1 (y/[a]): " AMSURE
	else
		read -n 1 AMSURE
	fi
	echo "" 1>&2
	if [ "$AMSURE" = "y" ] ; then
		return 0
	else
		return 1
	fi
}
myAskYNE()
{  
	local AMSURE
	if [ -n "$1" ] ; then
		read -n 1 -p "$1 (y/[a]): " AMSURE
	else
		read -n 1 AMSURE
	fi
	echo "" 1>&2
	if [ "$AMSURE" != "y" ] ; then
		exit
	fi
}
sayWait()
{
   local AMSURE
   [ -n "$1" ] && echo "$@" 1>&2
   read -n 1 -p "Press any key to continue..." AMSURE
   echo "" 1>&2
}
cdAndCheck()
{
   cd "$1"
   if ! [ "$(pwd)" = "$1" ] ; then
      echo "!!Не могу встать в директорию $1 - продолжение невозможно. Выходим." 1>&2
      exit 1
   fi
}
checkDir()
{
   if ! [ -d "$1" ] ; then
      if [ -z "$2" ] ; then
         echo "!!Нет директории $1 - продолжение невозможно. Выходим." 1>&2
      else
         echo "$2" 1>&2
      fi
      exit 1
   fi
}
checkFile()
{
   if ! [ -f "$1" ] ; then
      if [ -z "$2" ] ; then
         echo "!!Нет файла $1 - продолжение невозможно. Выходим." 1>&2
      else
         echo "$2" 1>&2
      fi
      exit 1
   fi
}
checkParm()
{
   if [ -z "$1" ] ; then
		echo "!!$2. Продолжение невозможно. Выходим." 1>&2
      exit 1
   fi
}
input1()
{
	local a1

	if [ -n "$1" ] ; then
		read -p "$1" -sn 1 cRes
	else
		read -sn 1 cRes
	fi

	# Проверка допустимых выборов
	#a1="$2"
	while [ "$2" = "${2#*$cRes}" ] ; do
		read -sn 1 cRes
	done
	echo $cRes 1>&2
}
procParmS()
{
	[ -z "$2" ] && return 1
   if [ "$1" = "$2" ] ; then
		cRes="$3"
		return 0
	fi
	return 1
}
procParmL()
{
	[ -z "$1" ] && return 1
   if [ "${2#$1=}" != "$2" ] ; then
      cRes="${2#$1=}"
		return 0
	fi
	return 1
}


