#! /usr/bin/env bash 

# mkdir then cd in 
mkdir_cd (
  mkdir -p "$1"
  cd "$1"
)

mkdir_cd new_folder
