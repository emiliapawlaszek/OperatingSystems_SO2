#!/bin/bash

# Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr
# wywołania skryptu). Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików.
# Nie powinien analizować dołączeń symbolicznych.

SKASOWANE=$1/$2
touch $SKASOWANE

for file in $1/*
do
  if [ ! -s $file ]
  then
    echo $file >> $SKASOWANE
    echo "" >> $SKASOWANE
    rm $file
  fi
done

# wywołanie :  ./zad9.sh ./example skas
