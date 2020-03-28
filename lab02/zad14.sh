#!/bin/bash

# Ustawienie na aktualny czasu ostatniej modyfikacji wszystkich plików zadanego katalogu
# (parametr wywołania skryptu), do których mamy prawo dostępu do zapisu/modyfikacji.

for file in $1/*
do
  if [ ! -d $file -a -w $file ]
  then
    touch $file
  fi
done

#wywołanie  ./zad14.sh ./example
