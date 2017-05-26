#!/bin/bash

QMAKESPEC="testing-win32"
LogFile="out.log"

cat /dev/null > $LogFile

EchoErr()
{
  echo "$@" 1>&2
}

LogMsg()
{
  local IN="$1"
  if [ -z "$1" ]
  then
    # This reads a string from stdin and stores it in a variable called IN
    read IN
  fi

  local DateTime=`date "+%Y/%m/%d %H:%M:%S"`
  echo '*****'$DateTime' ('$QMAKESPEC'): '$IN >> "$LogFile"
  echo $DateTime' ('$QMAKESPEC'): '$IN
}

echo "This statement is piped to LogMsg" | LogMsg
EchoErr "This statement is an error" 2>&1 | LogMsg
LogMsg "This statement is sent to LogMsg"
