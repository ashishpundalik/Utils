#!/bin/bash

echo "Code Download Path: $CODE_DOWNLOAD_PATH"

echo "Code Review Path: $CODE_REVIEW_PATH"

move_zip() {
  echo "unzipping $2..."
  unzip $CODE_DOWNLOAD_PATH/$2 -d $CODE_REVIEW_PATH/$1
  rm $CODE_DOWNLOAD_PATH/$2
}

clone_git() {
  echo $CODE_DOWNLOAD_PATH/$2
  file_name=$2
  extention=".bundle"
  blank=""
  assignment_name="${file_name/$extention/$blank}"
  clone_dest=$CODE_REVIEW_PATH/$1/$assignment_name
  echo "Cloning at Path: $CODE_REVIEW_PATH/$1/$assignment_name"
  git clone $CODE_DOWNLOAD_PATH/$2 $clone_dest
  rm $CODE_DOWNLOAD_PATH/$2
}

move_file() {
  echo "moving $2..."
  mv $CODE_DOWNLOAD_PATH/$2 $CODE_REVIEW_PATH/$1
}


if [[ -z "$CODE_DOWNLOAD_PATH" ]] || [[ -z "$CODE_REVIEW_PATH" ]]; then
  echo "Please set both CODE_REVIEW_PATH and CODE_DOWNLOAD_PATH env variables"
  exit 1
fi

mkdir -p $CODE_REVIEW_PATH/$1

if [[ "$2" = *.zip ]]
then
  move_zip $1 $2
elif [[ $2 == http://* ]] || [[ $2 == https://* ]] || [[ "$2" = *.bundle ]]
then
  clone_git $1 $2
else
  move_file $1 $2
fi
