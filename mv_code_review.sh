#!/bin/bash

echo "Code Download Path: "
echo $CODE_DOWNLOAD_PATH

echo "Code Review Path: "
echo $CODE_REVIEW_PATH


if [[ -z "$CODE_DOWNLOAD_PATH" ]] || [[ -z "$CODE_REVIEW_PATH" ]]; then
  echo "Please set both CODE_REVIEW_PATH and CODE_DOWNLOAD_PATH env variables"
  exit 1
fi

mkdir -p $CODE_REVIEW_PATH/$1/$2

if [[ "$3" = *.zip ]]
then
  move_zip
elif [[ $3 == http://* ]] || [[ $3 == https://* ]] || [[ "$3" = *.bundle ]]
then
  clone_git
else
  move_file
fi

move_zip() {
  echo "unzipping $3..."
  unzip $CODE_DOWNLOAD_PATH/$3 -d $CODE_REVIEW_PATH/$1/$2/
  rm $CODE_DOWNLOAD_PATH/$3
}

clone_git() {
  echo "cloning $3..."
  git clone $3 $CODE_REVIEW_PATH/$1/$2/
  rm $CODE_DOWNLOAD_PATH/$3
}

move_file() {
  echo "moving $3..."
  mv $CODE_DOWNLOAD_PATH/$3 $CODE_REVIEW_PATH/$1/$2/
}