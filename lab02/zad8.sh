#!/bin/bash

# Listowanie plików z zadanego katalogu (parametr wywołania skryptu), wraz z jego
# podkatalogami. Zawartość podkatalogów ma być listowana w postaci <ścieżka dostępu
# względem listowanego katalogu>/<nazwa pliku>. Ograniczyć liczbę zagnieżdżeń podkatalogów (np. do dwóch).


for file in $1/*
do
  echo `ls -R ./$file`
done
