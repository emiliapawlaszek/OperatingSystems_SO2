#!/bin/bash

# Łączenie w jeden plików z listy, umieszczonej w pliku o zadanej nazwie (parametr
# wywołania skryptu. Kolejność, w jakiej pliki zostaną połączone - ściśle według listy. Treść
# każdego pliku powinna być poprzedzona nagłówkiem z jego nazwą. Plik wynikowy powinien
# mieć nazwę pliku pierwotnie zawierającego listę.

# cd example
# touch p1.c
# touch p2.c
# touch p3.c
# touch lista
# w liście: p1.c p3.c p2.c

PLIK=$1

for file in `cat $1`
do
  echo $file
  echo $file >> $PLIK
  cat $file >> $PLIK
  echo "" >> $PLIK
done
