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

if [[ "$2" = *.zip ]]
then
  move_zip
elif [[ $2 == http://* ]] || [[ $2 == https://* ]] || [[ "$2" = *.bundle ]]
then
  clone_git
else
  move_file
fi

move_zip() {
  echo "unzipping $2..."
  unzip $CODE_DOWNLOAD_PATH/$2 -d $CODE_REVIEW_PATH/$1/
  rm $CODE_DOWNLOAD_PATH/$2
}

clone_git() {
  echo "cloning $2..."
  git clone $2 $CODE_REVIEW_PATH/$1/
  rm $CODE_DOWNLOAD_PATH/$2
}

move_file() {
  echo "moving $2..."
  mv $CODE_DOWNLOAD_PATH/$2 $CODE_REVIEW_PATH/$1/
}