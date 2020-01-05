#!/bin/bash
# wrapper for https://github.com/visit1985/mdp to reload changes automatically
# mdpa {filu}
if [ -z $1 ]
then
  echo "no file given"
  exit 1
fi
trap ctrl_c INT
function ctrl_c() {
  kill $pid
  exit 0
}
LTIME=`stat -c %Z $1`
mdp $1 &
pid=$!
while true    
do
  ATIME=`stat -c %Z $1`
  if [[ "$ATIME" != "$LTIME" ]]
  then    
    kill $pid
    LTIME=$ATIME
    mdp $1 &
    pid=$!
  fi
  sleep 0.1
done
