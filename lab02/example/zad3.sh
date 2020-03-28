#!/bin/bash

# Kasowanie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), poza
# plikami wykonywalnymi, mającymi ustawiony bit dostępu typu „execute”.

for file in $1/*
do
  if [ ! -x $file ]
  then
    rm $file
  fi
done
