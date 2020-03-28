#!/bin/bash

# Usuwanie wszystkich podkatalogów zadanego katalogu (parametr wywołania skryptu).
# Zawartość tych podkatalogów należy przenieść do katalogu nadrzędnego. Usuwanie dotyczy
# tylko jednego poziomu podkatalogów.

for file in $1/*
do
  if [ -d $file  ] # jeśli jest katalogiem
  then
    mv $file/* ./$1
    rm $file -r -f
  fi
done

# wywołanie: $ ./zad12.sh ./example
