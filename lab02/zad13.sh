#!/bin/bash

# Usuwanie z zadanego katalogu (pierwszy argument skryptu) wszystkich plików, których
# nazwy pokrywają się z nazwami w drugim katalogu (drugi argument). Nie usuwaj
# podkatalogów. Nie usuwaj również plików o nazwach pokrywających się z nazwami
# podkatalogów w drugim katalogu.

for file in `ls $1`
do
  for file2 in `ls $2`
  do
    if [ $file = $file2 -a ! -d $file -a ! -d $file2 ]
    then
      rm $1/$file -f
    fi
  done
done

# wywołanie:  ./zad13.sh ./example ./ex
