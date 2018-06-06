#!/bin/bash

mkdir -p /Users/aashishpundalik/Documents/Work/code_reviews/$1/$2

echo $3

if [[ "$3" = *.zip ]]
then
  echo "Aala! 1"
  unzip /Users/aashishpundalik/Downloads/$3 -d /Users/aashishpundalik/Documents/Work/code_reviews/$1/$2/
  rm /Users/aashishpundalik/Downloads/$3
elif [[ $3 == http://* ]] || [[ $3 == https://* ]]
then
  echo "Aala! 2"
  git clone $3 /Users/aashishpundalik/Documents/Work/code_reviews/$1/$2/
else
  echo "Aala! 3"
  mv /Users/aashishpundalik/Downloads/$3 /Users/aashishpundalik/Documents/Work/code_reviews/$1/$2/
fi
