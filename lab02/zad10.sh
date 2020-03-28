#!/bin/bash

# Porównanie zawartości dwóch zadanych katalogów (argumenty skryptu). Przy porównaniu
# należy ignorować podkatalogi. W wyniku wyświetlić na ekranie listę plików o identycznych
# nazwach w obu katalogach.

for file1 in `ls $1`
do
  for file2 in `ls $2`
  do
    if [ $file1 = $file2 ]
    then
      echo $file1
    fi
  done
done

# wywołanie:  ./zad10.sh ./example ./ex
